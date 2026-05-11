import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';

// Return file to share or save
abstract class SalePdfGenerator {
  // ── generate function ───────────────────────────────────────────────
  // Build pdf document in memory, save to temp directory, and return the file to use in cubit
  static Future<File> generate(SaleEntity sale) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) => _buildPage(context, sale),
      ),
    );

    // Save to temp directory
    // The temp directory is automatically cleared by the system
    // We don't need to clear it manually
    final Directory tempDir = await getTemporaryDirectory();
    final String fileName =
        'StockMate_${sale.invoiceNumber}_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final File file = File('${tempDir.path}/$fileName');

    await file.writeAsBytes(await pdf.save());
    return file;
  }

  static pw.Widget _buildPage(pw.Context context, SaleEntity sale) {
    final String formattedDate = DateFormat(
      'MMM dd, yyyy • HH:mm',
    ).format(sale.createdAt);

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // ── Header ────────────────────────────────────────
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'StockMate',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  'PREMIUM INVENTORY & SALES',
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ],
            ),
            pw.Container(
              padding: const pw.EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: pw.BoxDecoration(
                color: PdfColors.green100,
                borderRadius: pw.BorderRadius.circular(4),
              ),
              child: pw.Text(
                'COMPLETED',
                style: pw.TextStyle(
                  color: PdfColors.green800,
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),

        pw.SizedBox(height: 24),
        pw.Divider(),
        pw.SizedBox(height: 16),

        // ── Invoice Info ──────────────────────────────────
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Invoice Number',
                  style: const pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.grey600,
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  sale.invoiceNumber,
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                  'Date & Time',
                  style: const pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.grey600,
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(formattedDate, style: const pw.TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),

        pw.SizedBox(height: 16),

        pw.Row(
          children: [
            pw.Text(
              'Payment Method: ',
              style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
            ),
            pw.Text(
              sale.paymentMethod,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
            ),
          ],
        ),

        pw.SizedBox(height: 24),
        pw.Divider(),
        pw.SizedBox(height: 16),

        // ── Items Header ──────────────────────────────────
        pw.Text(
          'PURCHASED ITEMS',
          style: pw.TextStyle(
            fontSize: 10,
            fontWeight: pw.FontWeight.bold,
            letterSpacing: 1.5,
            color: PdfColors.grey600,
          ),
        ),
        pw.SizedBox(height: 12),

        // ── Items Table ───────────────────────────────────
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey300),
          columnWidths: {
            0: const pw.FlexColumnWidth(3),
            1: const pw.FlexColumnWidth(1),
            2: const pw.FlexColumnWidth(1.5),
            3: const pw.FlexColumnWidth(1.5),
          },
          children: [
            // Header row
            pw.TableRow(
              decoration: const pw.BoxDecoration(color: PdfColors.grey100),
              children: ['Item', 'Qty', 'Unit Price', 'Total']
                  .map(
                    (header) => pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        header,
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            // Item rows
            ...sale.items.map(
              (item) => pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text(
                      item.productName,
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text(
                      '${item.quantity}',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text(
                      '\$${item.unitPrice.toStringAsFixed(2)}',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text(
                      '\$${item.totalPrice.toStringAsFixed(2)}',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        pw.SizedBox(height: 16),
        pw.Divider(),
        pw.SizedBox(height: 8),

        // ── Total ─────────────────────────────────────────
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Row(
                  children: [
                    pw.Text(
                      'Subtotal: ',
                      style: const pw.TextStyle(
                        fontSize: 11,
                        color: PdfColors.grey600,
                      ),
                    ),
                    pw.Text(
                      '\$${sale.totalAmount.toStringAsFixed(2)}',
                      style: const pw.TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                pw.SizedBox(height: 8),
                pw.Row(
                  children: [
                    pw.Text(
                      'TOTAL AMOUNT: ',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      '\$${sale.totalAmount.toStringAsFixed(2)}',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.orange700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        pw.SizedBox(height: 32),

        // ── Footer ────────────────────────────────────────
        pw.Divider(),
        pw.SizedBox(height: 8),
        pw.Center(
          child: pw.Text(
            'Generated by StockMate • TRANSACTION LOGGED SECURELY',
            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey500),
          ),
        ),
      ],
    );
  }
}

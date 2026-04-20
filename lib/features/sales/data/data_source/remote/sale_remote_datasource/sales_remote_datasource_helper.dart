String generateInvoiceNumber() {
  final now = DateTime.now();
  final date =
      '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
  return 'INV-$date-${(1000 + now.millisecond)}';
}
// INV-YYYYMMDD-XXXX  ==> ex: INV-20260420-1550

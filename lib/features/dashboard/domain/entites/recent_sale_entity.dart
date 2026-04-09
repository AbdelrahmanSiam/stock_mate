class RecentSaleEntity {
  final String invoiceNumber; // INV-2024-001
  final String paymentMethod; // Cash | Visa
  final double totalAmount;
  final DateTime createdAt;

  const RecentSaleEntity({
    required this.invoiceNumber,
    required this.paymentMethod,
    required this.totalAmount,
    required this.createdAt,
  });
}
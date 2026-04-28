String generateInvoiceNumber() {
  final now = DateTime.now();

  final timePart = now.millisecondsSinceEpoch.toString().substring(7);
  final randomPart = (100 + (now.microsecond % 900)).toString();

  return 'INV-$timePart$randomPart';
}
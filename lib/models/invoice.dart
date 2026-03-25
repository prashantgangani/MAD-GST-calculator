import 'product.dart';

class Invoice {
  final List<Product> products;
  final DateTime dateTime;
  final double totalCGST;
  final double totalSGST;
  final double totalAmount;

  Invoice({
    required this.products,
    required this.dateTime,
    required this.totalCGST,
    required this.totalSGST,
    required this.totalAmount,
  });
}

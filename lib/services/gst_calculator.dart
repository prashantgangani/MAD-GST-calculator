import '../models/product.dart';

class GSTCalculator {
  static double calculateCGST(Product product) {
    return (product.price * product.gstRate) / 2;
  }

  static double calculateSGST(Product product) {
    return (product.price * product.gstRate) / 2;
  }

  static double calculateTotal(Product product) {
    return product.price + calculateCGST(product) + calculateSGST(product);
  }
}

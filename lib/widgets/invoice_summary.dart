import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/gst_calculator.dart';

class InvoiceSummary extends StatelessWidget {
  final List<Product> products;
  const InvoiceSummary({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalCGST = 0, totalSGST = 0, totalAmount = 0;
    for (var product in products) {
      totalCGST += GSTCalculator.calculateCGST(product);
      totalSGST += GSTCalculator.calculateSGST(product);
      totalAmount += GSTCalculator.calculateTotal(product);
    }
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CGST Total: ₹${totalCGST.toStringAsFixed(2)}'),
            Text('SGST Total: ₹${totalSGST.toStringAsFixed(2)}'),
            Text('Grand Total: ₹${totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

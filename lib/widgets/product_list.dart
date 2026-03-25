import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/gst_calculator.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final cgst = GSTCalculator.calculateCGST(product);
        final sgst = GSTCalculator.calculateSGST(product);
        final total = GSTCalculator.calculateTotal(product);
        return ListTile(
          title: Text(product.name),
          subtitle: Text('Price: ₹${product.price.toStringAsFixed(2)} | GST: ${(product.gstRate * 100).toStringAsFixed(0)}%'),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('CGST: ₹${cgst.toStringAsFixed(2)}'),
              Text('SGST: ₹${sgst.toStringAsFixed(2)}'),
              Text('Total: ₹${total.toStringAsFixed(2)}'),
            ],
          ),
        );
      },
    );
  }
}

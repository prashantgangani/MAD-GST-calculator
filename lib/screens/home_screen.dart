import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_form.dart';
import '../widgets/product_list.dart';
import '../widgets/invoice_summary.dart';
import '../widgets/history_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GST Billing App'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'New Invoice'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InvoiceScreen(),
            HistoryScreen(),
          ],
        ),
      ),
    );
  }
}

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final List<Product> _products = [];

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductForm(onAdd: _addProduct),
        Expanded(child: ProductList(products: _products)),
        InvoiceSummary(products: _products),
      ],
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HistoryList();
  }
}

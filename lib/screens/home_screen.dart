import 'package:flutter/material.dart';
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

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProductForm(),
        Expanded(child: ProductList()),
        InvoiceSummary(),
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

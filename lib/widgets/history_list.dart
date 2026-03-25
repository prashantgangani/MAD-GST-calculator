import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../models/invoice.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoices = StorageService.getInvoices();
    if (invoices.isEmpty) {
      return const Center(child: Text('No invoices yet.'));
    }
    return ListView.builder(
      itemCount: invoices.length,
      itemBuilder: (context, index) {
        final invoice = invoices[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text('Invoice #${index + 1}'),
            subtitle: Text('Date: ${invoice.dateTime}'),
            trailing: Text('Total: ₹${invoice.totalAmount.toStringAsFixed(2)}'),
          ),
        );
      },
    );
  }
}

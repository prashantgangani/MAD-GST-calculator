import '../models/invoice.dart';

class StorageService {
  // For prototype: In-memory storage. Replace with persistent storage for production.
  static final List<Invoice> _invoices = [];

  static void addInvoice(Invoice invoice) {
    _invoices.add(invoice);
  }

  static List<Invoice> getInvoices() {
    return _invoices.reversed.toList();
  }
}

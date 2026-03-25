# GST Billing App for TATA Retail Solutions

This Flutter app streamlines GST billing for cashiers, automating tax calculations, invoice generation, and sales record management.

## Folder Structure

- lib/
  - main.dart
  - models/
    - product.dart
    - invoice.dart
  - screens/
    - home_screen.dart
    - invoice_screen.dart
    - history_screen.dart
  - widgets/
    - product_form.dart
    - product_list.dart
    - invoice_summary.dart
    - history_list.dart
  - services/
    - gst_calculator.dart
    - storage_service.dart

## Features
- Add products with GST rates (5%, 12%, 18%, 28%)
- Auto-calculate CGST, SGST, and total
- Generate itemized bills
- Store and search transaction history
- Intuitive UI for cashiers

---

To run in Chrome:
```
flutter run -d chrome
```

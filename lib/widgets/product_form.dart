import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/gst_calculator.dart';

class ProductForm extends StatefulWidget {
  final void Function(Product) onAdd;
  const ProductForm({Key? key, required this.onAdd}) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  double _gstRate = 0.18;

  void _addProduct() {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        name: _nameController.text,
        price: double.parse(_priceController.text),
        gstRate: _gstRate,
      );
      widget.onAdd(product);
      _nameController.clear();
      _priceController.clear();
      setState(() {
        _gstRate = 0.18;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) => value == null || value.isEmpty ? 'Enter name' : null,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 100,
              child: TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? 'Enter price' : null,
              ),
            ),
            const SizedBox(width: 8),
            DropdownButton<double>(
              value: _gstRate,
              items: const [
                DropdownMenuItem(value: 0.05, child: Text('5%')),
                DropdownMenuItem(value: 0.12, child: Text('12%')),
                DropdownMenuItem(value: 0.18, child: Text('18%')),
                DropdownMenuItem(value: 0.28, child: Text('28%')),
              ],
              onChanged: (value) {
                setState(() {
                  _gstRate = value!;
                });
              },
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _addProduct,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

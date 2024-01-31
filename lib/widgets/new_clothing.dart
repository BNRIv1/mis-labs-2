import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/models/clothing.dart';

class NewClothing extends StatefulWidget {
  final Function addClothing;

  const NewClothing({super.key, required this.addClothing});

  @override
  State<NewClothing> createState() => _NewClothingState();
}

class _NewClothingState extends State<NewClothing> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  String name = "";
  String description = "";
  double price = 0.0;

  void _submitData() {
    if (_nameController.text.isEmpty || _descriptionController.text.isEmpty) {
      return;
    }

    name = _nameController.text;
    description = _descriptionController.text;
    price = double.parse(_priceController.text);

    final newClothing =
        Clothing(Random().nextInt(1000), name, description, price);

    widget.addClothing(newClothing);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "Name:"),
            onSubmitted: (_) => _submitData,
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: "Description:"),
            onSubmitted: (_) => _submitData,
          ),
          TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: "Price:"),
              onSubmitted: (_) => _submitData,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ]),
          ElevatedButton(
            onPressed: _submitData,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            child: const Text("Add new clothing"),
          )
        ],
      ),
    );
  }
}

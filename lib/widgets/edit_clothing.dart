import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/models/clothing.dart';

class EditClothing extends StatefulWidget {
  final Function editClothing;
  final int index;
  final Clothing clothing;

  const EditClothing(
      {super.key,
      required this.editClothing,
      required this.index,
      required this.clothing});

  @override
  State<EditClothing> createState() => _EditClothingState();
}

class _EditClothingState extends State<EditClothing> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  String name = "";
  String description = "";
  double price = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    _nameController.text = widget.clothing.name;
    _descriptionController.text = widget.clothing.description;
    _priceController.text = widget.clothing.price.toString();
  }

  void _submitData() {
    if (_nameController.text.isEmpty || _descriptionController.text.isEmpty) {
      return;
    }

    name = _nameController.text;
    description = _descriptionController.text;
    price = double.parse(_priceController.text);
    Random random = Random();

    final newClothing = Clothing(random.nextInt(100), name, description, price);

    widget.editClothing(newClothing, widget.index);

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
            child: const Text("Edit item"),
          )
        ],
      ),
    );
  }
}

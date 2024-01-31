import 'package:flutter/material.dart';
import 'package:lab2_201177/screens/shopping_cart_screen.dart';

import '../data/models/clothing.dart';
import '../widgets/edit_clothing.dart';
import '../widgets/new_clothing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Clothing> _clothing = [];
  final List<Clothing> _shoppingCart = [];

  void _addClothing() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewClothing(
              addClothing: _addNewClothingToList,
            ),
          );
        });
  }

  void _addNewClothingToList(Clothing newClothing) {
    setState(() {
      _clothing.add(newClothing);
    });
  }

  void _editClothing(index) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: EditClothing(
              editClothing: _editClothingFromList,
              index: index,
              clothing: _clothing[index],
            ),
          );
        });
  }

  void _editClothingFromList(Clothing newClothing, int index) {
    setState(() {
      _clothing[index].name = newClothing.name;
      _clothing[index].description = newClothing.description;
      _clothing[index].price = newClothing.price;
    });
  }

  void _addToShoppingCart(int index) {
    setState(() {
      _shoppingCart.add(_clothing[index]);
    });
  }

  void _goToShoppingCart() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ShoppingCartScreen(shoppingCart: _shoppingCart)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Clothing Store - 201177"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            ElevatedButton(
              onPressed: () => _addClothing(),
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green)),
              child: const Text(
                "Add New Clothing",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
        body: GridView.builder(
          itemCount: _clothing.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 20,
                child: SizedBox(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(_clothing[index].name)],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_clothing[index].price.toString()),
                          const Text("\$")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => _addToShoppingCart(index),
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll<Color>(Colors.green),
                            ),
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _clothing.removeAt(index);
                                });
                              },
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.green),
                              ),
                              child: const Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => _editClothing(index),
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.green)),
                              child: const Text(
                                "Edit",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ])
                    ],
                  ),
                ));
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: _goToShoppingCart,
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green),
                ),
                child: const Row(
                  children: [
                    Text(
                      "View cart",
                      style: TextStyle(color: Colors.red),
                    ),
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.red,
                    )
                  ],
                ))
          ],
        ));
  }
}

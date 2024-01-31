import 'package:flutter/material.dart';

import '../data/models/clothing.dart';

class ShoppingCartScreen extends StatefulWidget {
  final List<Clothing> shoppingCart;

  const ShoppingCartScreen({super.key, required this.shoppingCart});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clothing store 201177"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.builder(
        itemCount: widget.shoppingCart.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.shoppingCart[index].name),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.shoppingCart[index].price.toString()),
                    const Text("\$"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.shoppingCart.removeAt(index);
                        });
                      },
                      style: const ButtonStyle(
                        backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.green),
                      ),
                      child: const Text(
                        "Delete from cart",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                )
              ],
            ),

          );
        }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            setState(() {
              widget.shoppingCart.clear();
            });

          },
              style: const ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.lightGreenAccent),
              ),
              child: const Row(
                children: [
                  Text("Buy everything from your cart?", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),),
                  Icon(Icons.payment_rounded,color: Colors.blue,)
                ],
              )
          )
        ],
      ),
    );
  }
}
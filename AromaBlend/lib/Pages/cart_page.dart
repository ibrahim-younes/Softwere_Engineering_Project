import 'package:aroma_blend_app/components/drink_tile.dart';
import 'package:aroma_blend_app/models/drink.dart';
import 'package:aroma_blend_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<AromaBlend>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AromaBlend>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    //heading
                    const Text(
                      'Your Cart',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // list of cart items
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          // get individual drink in cart first
                          Drink drink = value.cart[index];

                          // return as nice tile
                          return DrinkTile(
                            drink: drink,
                            onTap: () => removeFromCart(drink),
                            trailing: Icon(Icons.delete),
                          );
                        },
                      ),
                    ),

                    // pay button
                    MaterialButton(
                      child: Text(
                        'Pay 💵',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ));
  }
}

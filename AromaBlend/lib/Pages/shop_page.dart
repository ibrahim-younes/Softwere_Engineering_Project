import 'package:aroma_blend_app/components/drink_tile.dart';
import 'package:aroma_blend_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';
import 'order_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // user selected a dring, go to order page.
  void goToOrderPage(Drink drink) {
    //Navigate to order page
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderPage(
            drink: drink,
          ),
        ));
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
              Text(
                "AromaBlend",
                style: TextStyle(fontSize: 25),
              ),

              const SizedBox(height: 10),

              // list of drinks for sale
              Expanded(
                child: ListView.builder(
                  itemCount: value.shop.length,
                  itemBuilder: (context, index) {
                    //get individual drink from shop
                    Drink individualDrink = value.shop[index];
                    //return that drink as a nice tile
                    return DrinkTile(
                      drink: individualDrink,
                      onTap: () => goToOrderPage(individualDrink),
                      trailing: Icon(Icons.arrow_forward),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

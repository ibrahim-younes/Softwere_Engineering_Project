import 'package:flutter/material.dart';

import 'drink.dart';

class AromaBlend extends ChangeNotifier {
  // drinks for sale
  final List<Drink> shop = [
    Drink(name: "Latte", price: "15", imagePath: "lib/images/latte-macchiato.png"),
    Drink(name: "Mocha", price: "25", imagePath: "lib/images/mocha.png"),
    Drink(name: "Espresso", price: "5", imagePath: "lib/images/espresso.png"),
  ];

  // list of drinks in user cart
  final List<Drink> userCart = [];

  //get drinks for sale
  List<Drink> get shopDrinks => shop;

  //get user cart
  List<Drink> get cart => userCart;

  //add dring to cart
  void addToCart(Drink drink) {
    userCart.add(drink);
    notifyListeners();
  }

  // remove drink from cart
  void removeFromCart(Drink drink) {
    userCart.remove(drink);
    notifyListeners();
  }
}

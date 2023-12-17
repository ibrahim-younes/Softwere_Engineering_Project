import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: const Color.fromARGB(189, 205, 88, 5),
          color: const Color.fromARGB(255, 89, 58, 46),
          tabActiveBorder: Border.all(color: Colors.white),
          gap: 8,
          tabs: const [
            // Shop tab
            GButton(
              icon: Icons.home,
              text: "Shop",
            ),

            //cart tab
            GButton(
              icon: Icons.shopping_cart_checkout,
              text: "Cart",
            ),
            GButton(
              icon: Icons.person,
              text: "Profile",
            )
          ]),
    );
  }
}

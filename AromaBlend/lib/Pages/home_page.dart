import 'package:aroma_blend_app/Pages/profile_page.dart';
import 'package:aroma_blend_app/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//pages to display
final List<Widget> pages = [
  //shop
  const ShopPage(),

  //cart
  const CartPage(),

  const ProfilePage(),
];

class _HomePageState extends State<HomePage> {
  //navigate bottom bar
  int selectedIndex = 0;
  void navigateBottomBar(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: pages[selectedIndex],
    );
  }
}

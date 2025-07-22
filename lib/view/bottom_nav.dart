import 'package:e_commerce_app/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  List<Widget> pages = [HomePage()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        padding: EdgeInsets.all(20),
        // tabBorder: Border.all(width: 1, color: Colors.white),
        tabMargin: EdgeInsets.all(12),
        gap: 8,
        backgroundColor: Colors.black,
        selectedIndex: currentIndex,
        activeColor: Colors.white,
        color: Colors.grey,
        iconSize: 32,
        mainAxisAlignment: MainAxisAlignment.center,
        tabs: [
          GButton(icon: PhosphorIconsBold.house, text: "Home"),
          GButton(icon: PhosphorIconsBold.shoppingCart, text: "Cart"),
        ],
        onTabChange: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
}

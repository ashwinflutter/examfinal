import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class hhh extends StatefulWidget {
  const hhh({Key? key}) : super(key: key);

  @override
  State<hhh> createState() => _hhhState();
}

class _hhhState extends State<hhh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: FancyBottomNavigation(
      tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: Icons.search, title: "Search"),
        TabData(iconData: Icons.shopping_cart, title: "Basket"),
        TabData(iconData: Icons.edit, title: "EDIT")
      ],
      onTabChangedListener: (position) {
        setState(() {
         print("===$position");
        });
      },
    ));
  }
}

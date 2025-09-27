import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:megawatt/view/cart.dart';
import 'package:megawatt/view/home.dart';
import 'package:megawatt/view/homepage.dart';
import 'package:megawatt/view/profile.dart';
import 'package:megawatt/view/search.dart';
import 'package:megawatt/view/settings.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //keeps trac of the selected index /current page
  int _selectedIndex = 0;
  //updates the new selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // A list of pages to display based on the selected index.
  final List _pages = [
    Home(), //home page
    Search(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text('Megawatt Cafe', style: AppTextStyles.heading2(context)),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      */
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],

        // The color of the selected item, from the theme's color scheme.
        selectedItemColor: Theme.of(context).colorScheme.primary,
        // The color of unselected items, with a slight tint.
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        // Use shifting type for a modern look.
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}

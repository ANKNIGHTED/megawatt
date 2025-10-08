import 'package:flutter/material.dart';

import 'package:megawatt/view/cart.dart';
import 'package:megawatt/view/home.dart';

import 'package:megawatt/view/profile.dart';
import 'package:megawatt/view/search.dart';
import 'package:megawatt/utils/cart_badge.dart'; // added import

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  static _HomepageState of(BuildContext context) {
    // Looks up the state object in the widget tree
    return context.findAncestorStateOfType<_HomepageState>()!;
  }

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //keeps trac of the selected index /current page
  int _selectedIndex = 0;
  int _searchInitialTabIndex = 0;
  //updates the new selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateToTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateToSearchWithTab(int tabIndex) {
    setState(() {
      _searchInitialTabIndex = tabIndex; // Set the category index for Search
      _selectedIndex =
          1; // Navigate to the Search tab (assuming Search is at index 1)
    });
  }

  @override
  Widget build(BuildContext context) {
    // A list of pages to display based on the selected index.
    final List _pages = [
      Home(),

      Search(initialTabIndex: _searchInitialTabIndex),
      Cart(),
      Profile(),
    ];
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
            // replaced plain icon with CartBadge so a purple notch shows item count
            icon: CartBadge(onTap: () => _onItemTapped(2)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],

        selectedItemColor: Theme.of(context).colorScheme.primary,

        unselectedItemColor: Theme.of(context).colorScheme.secondary,

        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}

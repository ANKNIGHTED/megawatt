import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:megawatt/model/food.dart';
import 'package:megawatt/model/restaurant.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/foodtile.dart';
import 'package:megawatt/utils/sliverappbar.dart';
import 'package:megawatt/utils/tabbar.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:megawatt/view/foodpage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Search extends StatefulWidget {
  final int initialTabIndex;
  const Search({super.key, this.initialTabIndex = 0});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      initialIndex: widget.initialTabIndex,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List categories = [
    ['images/categories/breakfast.png', 'Breakfast'],
    ['images/categories/lunch.png', 'Lunch'],
    ['images/categories/desserts.png', 'Desserts'],
    ['images/categories/appetisers.png', 'Appetisers'],
    ['images/categories/snacks.png', 'Snacks'],
    ['images/categories/fruits.png', 'Fruits'],
    ['images/categories/beverages.png', 'Beverages'],
    ['images/categories/specials.png', 'Specials'],
  ];

  // to sort and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given category

  List<Widget> getFoodinThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((Category) {
      List<Food> categoryMenu = _filterMenuByCategory(Category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          //get individual food
          final Food = categoryMenu[index];
          //return food tile UI
          return Foodtile(
            food: Food,
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Foodpage(food: Food)),
                ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final tabTitles =
        FoodCategory.values.map((category) => category.name).toList();
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder:
              (context, innerBoxIsScrolled) => [
                Sliverappbar(
                  child: Text('Hello'),
                  title: Tabbar(
                    tabController: _tabController,
                    tabs: tabTitles.map((title) => Tab(text: title)).toList(),
                  ),
                ),
              ],
          body: Consumer<Restaurant>(
            builder:
                (context, restaurant, child) => TabBarView(
                  controller: _tabController,
                  children: getFoodinThisCategory(restaurant.menu),
                ),
          ),
        ),
      ),
    );
  }
}

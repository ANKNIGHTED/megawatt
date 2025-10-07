import 'package:flutter/material.dart';
import 'package:megawatt/model/food.dart';

class Tabbar extends StatelessWidget {
  final TabController tabController;
  const Tabbar({
    super.key,
    required this.tabController,
    required List<dynamic> tabs,
  });
  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(text: category.toString().split('.').last);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(controller: tabController, tabs: _buildCategoryTabs()),
    );
  }
}

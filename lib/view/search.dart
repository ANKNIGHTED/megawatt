import 'package:flutter/material.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:sizer/sizer.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          children: [
            SizedBox(height: 2.h),
            Text(
              'All Categories',
              style: AppTextStyles.heading2(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3.h),
            GridView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          color: AppColors.accentOrange,
                        ),
                        child: Image(image: AssetImage(categories[index][0])),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      categories[index][1],
                      style: AppTextStyles.subheading(context),
                    ),
                  ],
                );
              },
              itemCount: categories.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

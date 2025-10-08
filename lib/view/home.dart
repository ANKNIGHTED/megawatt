import 'package:flutter/material.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/currentlocation.dart';
import 'package:megawatt/utils/descriptionbox.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:megawatt/view/homepage.dart';
import 'package:megawatt/view/search.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Define categories outside the build method
  final List categories = const [
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
        // The main scrollable area
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
          child: Column(
            // Use Column instead of ListView here
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),

              // Location and Description Box
              Currentlocation(),
              const DescriptionBox(),

              SizedBox(height: 2.h),

              // Specials Row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: AppColors.accentPurple,
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceAround, // Added alignment for better display
                        children: [
                          Text(
                            "Specials",
                            style: AppTextStyles.subheading(context),
                          ),
                          // The 'Specials' image part
                          SizedBox(
                            width: 20.h,
                            child: const Image(
                              // Added const to Image
                              image: AssetImage(
                                'images/categories/specials.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 3.h),

              // GridView for Categories
              GridView.builder(
                itemBuilder: (context, index) {
                  final initialTabIndex = categories[index][1];

                  return GestureDetector(
                    onTap: () {
                      final homePageState = Homepage.of(context);
                      homePageState.navigateToSearchWithTab(index);
                      /*
                      // Navigate to the Search page, passing the index
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Search(
                                initialTabIndex: index, // Pass the index
                              ),
                        ),
                      );
                      */
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                              color: AppColors.accentOrange,
                            ),
                            child: Image(
                              image: AssetImage(categories[index][0]),
                            ),
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          categories[index][1],
                          style: AppTextStyles.subheading(context),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: categories.length,

                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

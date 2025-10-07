import 'package:flutter/material.dart';
import 'package:megawatt/model/food.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:sizer/sizer.dart';

class Foodtile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const Foodtile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name, style: AppTextStyles.subheading(context)),
                      Text(
                        "Ksh " + food.price.toString(),
                        style: AppTextStyles.body(
                          context,
                        ).copyWith(color: AppColors.textMuted),
                      ),
                      SizedBox(height: 5),
                      Text(
                        food.description,
                        style: AppTextStyles.caption(context).copyWith(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                //image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(food.imagepath, height: 20.h),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: AppColors.textMuted, endIndent: 25, indent: 25),
      ],
    );
  }
}

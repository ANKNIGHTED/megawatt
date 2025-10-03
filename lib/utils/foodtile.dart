import 'package:flutter/material.dart';
import 'package:megawatt/model/food.dart';

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
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(food.name),
                    Text(food.price.toString()),
                    Text(food.description),
                  ],
                ),
              ),
              //image
              Image.asset(food.imagepath),
            ],
          ),
        ),
      ],
    );
  }
}

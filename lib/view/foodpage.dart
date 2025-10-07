import 'package:flutter/material.dart';
import 'package:megawatt/model/food.dart';
import 'package:megawatt/model/restaurant.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/mybutton.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Foodpage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  Foodpage({super.key, required this.food}) {
    //initialize selected addon to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context); //close current food page back to menu

    //format selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Image.asset(widget.food.imagepath, height: 30.h),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: AppTextStyles.subheading(context),
                      ),
                      Text(
                        "Ksh ${widget.food.price.toString()}",
                        style: AppTextStyles.body(context),
                      ),
                      Text(
                        widget.food.description,
                        style: AppTextStyles.caption(context).copyWith(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Add-ons"),

                      //addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.accentOrange),
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            //individual addons
                            Addon addon = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text("Ksh ${addon.price.toString()}"),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Mybutton(
                  text: "Add to cart",
                  onTap: () => addToCart(widget.food, widget.selectedAddons),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 5.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ],
    );
  }
}

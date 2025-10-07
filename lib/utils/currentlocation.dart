import 'package:flutter/material.dart';
import 'package:megawatt/model/restaurant.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:provider/provider.dart';

class Currentlocation extends StatelessWidget {
  final textController = TextEditingController();
  Currentlocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Your Location"),

            content: TextField(
              controller: textController,
              decoration: const InputDecoration(hintText: "Enter Address"),
            ),
            actions: [
              //cancel button
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),

              //save button
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  //update delivery address

                  String newAdress = textController.text;
                  context.read<Restaurant>().updateDeliveryAddresss(newAdress);

                  textController.clear();
                },
                child: const Text("Save"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery", style: AppTextStyles.subheading(context)),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder:
                      (context, restaurant, child) => Text(
                        restaurant.deliveryAddress,
                        style: AppTextStyles.body(context),
                      ),
                ),

                //address
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

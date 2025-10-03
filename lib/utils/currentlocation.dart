import 'package:flutter/material.dart';
import 'package:megawatt/utils/textstyles.dart';

class Currentlocation extends StatelessWidget {
  const Currentlocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Your Location"),
            content: const TextField(
              decoration: const InputDecoration(hintText: "search Address"),
            ),
            actions: [
              //cancel button
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),

              //save button
              MaterialButton(
                onPressed: () => Navigator.pop(context),
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
                //address
                Text('First Floor', style: AppTextStyles.body(context)),
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

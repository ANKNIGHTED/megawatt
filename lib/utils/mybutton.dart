import 'package:flutter/material.dart';
import 'package:megawatt/utils/textstyles.dart';

class Mybutton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const Mybutton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Center(child: Text(text, style: AppTextStyles.button(context))),
      ),
    );
  }
}

/*
ElevatedButton(
                onPressed: () {
                  // TODO: Implement login logic here
                  debugPrint('Login button pressed');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Login', style: AppTextStyles.button(context)),
              ),
*/

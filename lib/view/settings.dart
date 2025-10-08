import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:megawatt/controller/provider/colors_provider.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:megawatt/view/homepage.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsProvider = Provider.of<ColorsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            );
          },
          icon: const Icon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: AppTextStyles.subheading(
                    context,
                  ).copyWith(color: AppColors.textDark),
                ),
                CupertinoSwitch(
                  value: colorsProvider.isDarkMode,
                  onChanged: (value) => colorsProvider.toggleTheme(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

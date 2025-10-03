import 'package:flutter/material.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:sizer/sizer.dart';

class Sliverappbar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const Sliverappbar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //collapsedHeight: 100,
      //toolbarHeight: 56,
      automaticallyImplyLeading: false,
      expandedHeight: 100,
      //pinned: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inverseSurface,
      title: Text(
        'All Categories',
        style: AppTextStyles.heading2(context),
        textAlign: TextAlign.center,
      ),

      flexibleSpace: FlexibleSpaceBar(
        background: Padding(padding: const EdgeInsets.all(8)),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}

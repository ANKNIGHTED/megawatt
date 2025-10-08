import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:megawatt/model/restaurant.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/view/cart.dart';

class CartBadge extends StatelessWidget {
  final VoidCallback? onTap;
  const CartBadge({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, _) {
        final int count = restaurant.getTotalItemCount();
        return Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
              onPressed:
                  onTap ??
                  () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => const Cart()));
                  },
            ),
            if (count > 0)
              Positioned(
                right: 4,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryPurple,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Text(
                    count > 99 ? '99+' : count.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

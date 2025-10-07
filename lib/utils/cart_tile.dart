import 'package:flutter/material.dart';
import 'package:megawatt/model/Cart_item.dart';
import 'package:megawatt/model/restaurant.dart';
import 'package:megawatt/utils/colors.dart';
import 'package:megawatt/utils/quantity_selector.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:
          (context, restaurant, child) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cartItem.food.imagepath,
                          height: 20.h,
                        ),
                      ),
                      SizedBox(width: 10.h),

                      //name and price
                      Column(
                        children: [
                          Text(
                            cartItem.food.name,
                            style: TextStyle(color: AppColors.textDark),
                          ),
                          Text(
                            "Ksh ${cartItem.food.price.toString()}",
                            style: TextStyle(color: AppColors.textMuted),
                          ),
                        ],
                      ),
                      const Spacer(),

                      //increment or decrement
                      QuantitySelector(
                        food: cartItem.food,
                        quantity: cartItem.quantity,
                        onDecrement: () {
                          restaurant.removeFromCart(cartItem);
                        },
                        onIncrement: () {
                          restaurant.addToCart(
                            cartItem.food,
                            cartItem.selectedAddons,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                //addons
                SizedBox(
                  height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    children:
                        cartItem.selectedAddons
                            .map(
                              (addon) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: FilterChip(
                                  label: Row(
                                    children: [
                                      //addon name  and price
                                      Text(addon.name),
                                      Text("Ksh ${addon.price.toString()}"),
                                    ],
                                  ),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                  onSelected: (value) {},
                                  backgroundColor:
                                      Theme.of(
                                        context,
                                      ).colorScheme.secondaryContainer,
                                  labelStyle: TextStyle(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onInverseSurface,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

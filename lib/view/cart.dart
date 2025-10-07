import 'package:flutter/material.dart';
import 'package:megawatt/model/Cart_item.dart';
import 'package:megawatt/model/restaurant.dart';
import 'package:megawatt/model/food.dart';
import 'package:megawatt/utils/cart_tile.dart';
import 'package:megawatt/utils/mybutton.dart';
import 'package:megawatt/utils/textstyles.dart';
import 'package:megawatt/view/payment.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //access cart
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Cart')),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.secondary,
            automaticallyImplyLeading: false,
            actions: [
              if (userCart.isNotEmpty)
                IconButton(
                  onPressed: () {
                    if (userCart.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: Text(
                                'Are you sure you want to delete the cart?',
                              ),
                              actions: [
                                //cancel and agree
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "Cancel",
                                    style: AppTextStyles.button(context),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    restaurant.clearCart();
                                  },
                                  child: Text(
                                    "Yes",
                                    style: AppTextStyles.button(context),
                                  ),
                                ),
                              ],
                            ),
                      );
                    }
                    ;
                  },
                  icon: Icon(Icons.delete),
                ),
            ],
          ),
          body: Column(
            children: [
              //list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                          child: Center(
                            child: Text(
                              "Selected Items will appear here",
                              style: AppTextStyles.subheading(context),
                            ),
                          ),
                        )
                        : Expanded(
                          child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              //individual cart item
                              final CartItem = userCart[index];
                              //return cart tile UI

                              return CartTile(cartItem: CartItem);
                            },
                          ),
                        ),
                    SizedBox(height: 5.h),
                    // button to pay
                    if (userCart.isNotEmpty)
                      Mybutton(
                        text: "Go to Check Out",
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Payment(),
                              ),
                            ),
                      ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

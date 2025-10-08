import 'package:megawatt/model/food.dart';

class CartItem {
  final Food food;
  int quantity;
  List<Addon> selectedAddons;

  CartItem({
    required this.food,
    required this.quantity,
    required this.selectedAddons,
  });

  double get total {
    final addonsTotal = selectedAddons.fold<double>(
      0.0,
      (s, a) => s + (a.price),
    );
    return (food.price * quantity) + addonsTotal;
  }

  Map<String, dynamic> toMap() {
    return {
      'food': food.toMap(),
      'quantity': quantity,
      'selectedAddons': selectedAddons.map((a) => a.toMap()).toList(),
      'itemTotal': total,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      food: Food.fromMap(Map<String, dynamic>.from(map['food'] ?? {})),
      quantity: (map['quantity'] as num?)?.toInt() ?? 1,
      selectedAddons:
          (map['selectedAddons'] as List<dynamic>?)
              ?.map((e) => Addon.fromMap(Map<String, dynamic>.from(e)))
              .toList() ??
          [],
    );
  }
}

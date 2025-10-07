import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:megawatt/model/Cart_item.dart';
import 'package:megawatt/model/food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //lunch
    Food(
      name: "Pilau",
      description:
          "A Pilau with beef is a rich and aromatic one-pot meal where long-grain rice ",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.lunch,
      availableAddons: [
        Addon(name: 'Kachumabrari', price: 50),
        Addon(name: 'Kachumabrari', price: 50),
        Addon(name: 'Kachumabrari', price: 50),
      ],
    ),
    Food(
      name: "Pilau",
      description:
          "A Pilau with beef is a rich and aromatic one-pot meal where long-grain rice ",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.lunch,
      availableAddons: [
        Addon(name: 'Kachumabrari', price: 50),
        Addon(name: 'Kachumabrari', price: 50),
        Addon(name: 'Kachumabrari', price: 50),
      ],
    ),
    Food(
      name: "Pilau",
      description:
          "A Pilau with beef is a rich and aromatic one-pot meal where long-grain rice ",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.lunch,
      availableAddons: [
        Addon(name: 'Kachumabrari', price: 50),
        Addon(name: 'Kachumabrari', price: 50),
        Addon(name: 'Kachumabrari', price: 50),
      ],
    ),
    Food(
      name: "Pilau",
      description:
          "A Pilau with beef is a rich and aromatic one-pot meal where long-grain rice ",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.lunch,
      availableAddons: [
        Addon(name: 'Kachumabrari', price: 50),
        Addon(name: 'Kachumabrari', price: 50),
        Addon(name: 'Kachumabrari', price: 50),
      ],
    ),
    Food(
      name: "Pilau",
      description:
          "A Pilau with beef is a rich and aromatic one-pot meal where long-grain rice ",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.lunch,
      availableAddons: [
        Addon(name: 'Kachumabrari', price: 50),
        Addon(name: 'Kachumabrari', price: 50),
        Addon(name: 'Kachumabrari', price: 50),
      ],
    ),
    // drinks
    Food(
      name: "Kenyan Tea",
      description:
          "It is a rich, coppery-red brew, often achieved by boiling the black tea leaves directly in a mix of milk and water until it reaches a deep, inviting amber hue ",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'sugar packet', price: 50),
        Addon(name: 'honey', price: 50),
        Addon(name: 'extra tea bag', price: 50),
      ],
    ),
    Food(
      name: "Kenyan Tea",
      description:
          "It is a rich, coppery-red brew, often achieved by boiling the black tea leaves directly in a mix of milk and water until it reaches a deep, inviting amber hue ",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'sugar packet', price: 50),
        Addon(name: 'honey', price: 50),
        Addon(name: 'extra tea bag', price: 50),
      ],
    ),
    Food(
      name: "Kenyan Tea",
      description:
          "It is a rich, coppery-red brew, often achieved by boiling the black tea leaves directly in a mix of milk and water until it reaches a deep, inviting amber hue ",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'sugar packet', price: 50),
        Addon(name: 'honey', price: 50),
        Addon(name: 'extra tea bag', price: 50),
      ],
    ),
    Food(
      name: "Kenyan Tea",
      description:
          "It is a rich, coppery-red brew, often achieved by boiling the black tea leaves directly in a mix of milk and water until it reaches a deep, inviting amber hue ",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'sugar packet', price: 50),
        Addon(name: 'honey', price: 50),
        Addon(name: 'extra tea bag', price: 50),
      ],
    ),
    Food(
      name: "Kenyan Tea",
      description:
          "It is a rich, coppery-red brew, often achieved by boiling the black tea leaves directly in a mix of milk and water until it reaches a deep, inviting amber hue ",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'sugar packet', price: 50),
        Addon(name: 'honey', price: 50),
        Addon(name: 'extra tea bag', price: 50),
      ],
    ),
    //fruits
    Food(
      name: "Fruit Salad",
      description:
          " a chunky mosaic of sunny gold mango and spiky yellow pineapple, speckled with the electric green coins of kiwi and the velvety orange cubes of papaya",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.fruits,
      availableAddons: [],
    ),
    Food(
      name: "Fruit Salad",
      description:
          " a chunky mosaic of sunny gold mango and spiky yellow pineapple, speckled with the electric green coins of kiwi and the velvety orange cubes of papaya",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 350,
      category: FoodCategory.fruits,
      availableAddons: [],
    ),
    Food(
      name: "Fruit Salad",
      description:
          " a chunky mosaic of sunny gold mango and spiky yellow pineapple, speckled with the electric green coins of kiwi and the velvety orange cubes of papaya",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 150,
      category: FoodCategory.fruits,
      availableAddons: [],
    ),
    //snacks
    Food(
      name: "Chapati",
      description:
          "a soft, round flatbread that serves as a staple scoop for stews and curries.",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 50,
      category: FoodCategory.snacks,
      availableAddons: [],
    ),
    Food(
      name: "Chapati",
      description:
          "a soft, round flatbread that serves as a staple scoop for stews and curries.",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 50,
      category: FoodCategory.snacks,
      availableAddons: [],
    ),
    Food(
      name: "Chapati",
      description:
          "a soft, round flatbread that serves as a staple scoop for stews and curries.",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 50,
      category: FoodCategory.snacks,
      availableAddons: [],
    ),
    //appetisers
    Food(
      name: "Butternut soup with Crusty Bread",
      description:
          " rich, creamy, and flavorful soup seasoned with nutmeg, cinnamon, sage and ginger served with Crusty Bread or Baguette ,",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 50,
      category: FoodCategory.appetisers,
      availableAddons: [],
    ),
    Food(
      name: "Butternut soup with Crusty Bread",
      description:
          " rich, creamy, and flavorful soup seasoned with nutmeg, cinnamon, sage and ginger served with Crusty Bread or Baguette ,",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 50,
      category: FoodCategory.appetisers,
      availableAddons: [],
    ),
    Food(
      name: "Butternut soup with Crusty Bread",
      description:
          " rich, creamy, and flavorful soup seasoned with nutmeg, cinnamon, sage and ginger served with Crusty Bread or Baguette ,",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 50,
      category: FoodCategory.appetisers,
      availableAddons: [],
    ),
    Food(
      name: "Butternut soup with Crusty Bread",
      description:
          " rich, creamy, and flavorful soup seasoned with nutmeg, cinnamon, sage and ginger served with Crusty Bread or Baguette ,",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 150,
      category: FoodCategory.appetisers,
      availableAddons: [],
    ),
    //desserts
    Food(
      name: "Cupcakes",
      description: "  soft tender  ,promising a moist, fluffy bite.",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 80,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),
    Food(
      name: "Cake Slice",
      description: "  soft tender   ,promising a moist, fluffy bite.",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 200,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),
    Food(
      name: "Ice cream scoup",
      description: "  soft tender   ,promising a moist, fluffy bite.",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 150,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "sprinkles", price: 50),
        Addon(name: "cherries", price: 100),
        Addon(name: "oreo", price: 80),
      ],
    ),

    //breakfast
    Food(
      name: "Bacon",
      description: " crispy bacon.",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 80,
      category: FoodCategory.breakfast,
      availableAddons: [],
    ),
    Food(
      name: "Bacon",
      description: " crispy bacon.",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 80,
      category: FoodCategory.breakfast,
      availableAddons: [],
    ),
    Food(
      name: "Bacon",
      description: " crispy bacon.",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 80,
      category: FoodCategory.breakfast,
      availableAddons: [],
    ),
    Food(
      name: "Bacon",
      description: " crispy bacon.",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 80,
      category: FoodCategory.breakfast,
      availableAddons: [],
    ),
  ];
  //getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  //OPERATIONS
  //user cart
  final List<CartItem> _cart = [];

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;
      //check if list of selected addons  are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameFood && isSameAddons;
    });
    //if item exists, increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise add new cart item
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
  //HELPERS

  //generate a receipt

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    String formattedDate = DateFormat(
      "yyyy-MM-dd HH:mm:ss",
    ).format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-----------------");
    receipt.writeln();
    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} -${_formatPrice(cartItem.food.price)} ",
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("--------------------");
    receipt.writeln();
    receipt.writeln("Total Items:${getTotalItemCount()}");
    receipt.writeln("Total price:${_formatPrice(getTotalPrice())}");
    return receipt.toString();
  }

  //format a double to money value
  String _formatPrice(double price) {
    return "Ksh ${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
        .join(",");
  }
}

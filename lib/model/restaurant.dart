import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:megawatt/model/Cart_item.dart';
import 'package:megawatt/model/food.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant extends ChangeNotifier {
  // Method to upload the initial menu data to Firestore
  static Future<void> uploadInitialMenu(List<Food> initialMenu) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final CollectionReference menuRef = db.collection('menu');

    /*
    // OPTIONAL: Clear existing data (use with caution, only for initial setup)
    final existingDocs = await menuRef.get();
    for (final doc in existingDocs.docs) {
      await doc.reference.delete();
    }
    */

    // Upload each Food item
    for (final food in initialMenu) {
      try {
        // Use the toMap() method to serialize the Food object
        await menuRef.add(food.toMap());
        debugPrint('Successfully uploaded menu item: ${food.name}');
      } catch (e) {
        debugPrint('Error uploading ${food.name}: $e');
      }
    }
    debugPrint('--- Menu Upload Complete ---');
  }

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
        Addon(name: 'Kachumbari', price: 50),
        Addon(name: 'Coleslaw', price: 80),
        Addon(name: 'Extra Onions', price: 30),
        Addon(name: 'Pickles', price: 80),
      ],
    ),
    Food(
      name: "Rice with Chicken",
      description:
          "Chicken Stew, a rich, savory spectacle of tender chicken pieces swimming in a thick, glossy, orange-red gravy served with white rice ",
      imagepath: 'assets/images/lunch/chickenmanagu.png',
      price: 550,
      category: FoodCategory.lunch,
      availableAddons: [
        Addon(name: 'Kachumbari', price: 50),
        Addon(name: 'Avocado', price: 50),
        Addon(name: 'Extra tomato rings', price: 30),
        Addon(name: 'freshly ground pepper', price: 30),
      ],
    ),
    Food(
      name: "Ugali with Beef and sukumawiki",
      description:
          "a dense, firm mound of white cornmeal porridge and beef chunks are fork-tender and coated in a deep, flavorful gravy with  a vibrant pile of lightly sautéed greens ",
      imagepath: 'assets/images/lunch/ugalibeef.png',
      price: 450,
      category: FoodCategory.lunch,
      availableAddons: [
        Addon(name: 'Kachumbari', price: 50),
        Addon(name: 'Avocado', price: 50),
        Addon(name: 'Pickles', price: 80),
        Addon(name: 'freshly ground pepper', price: 30),
      ],
    ),
    Food(
      name: "Matoke with Liver",
      description:
          "A green cooking bananas that have been peeled, steamed, and often mashed into a soft, pale yellow, somewhat doughy texture served with beef or goat—pan-fried or simmered in a light, savory, and richly seasoned gravy with onions, giving it a deep, earthy, and metallic tang  a portion of brightly colored, crunchy Cabbage, ",
      imagepath: 'assets/images/lunch/matokeliver.png',
      price: 490,
      category: FoodCategory.lunch,
      availableAddons: [
        Addon(name: 'Kachumbari', price: 50),
        Addon(name: 'Pickles', price: 80),
        Addon(name: 'freshly ground pepper', price: 30),
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
        Addon(name: 'Avocado', price: 50),
        Addon(name: 'freshly ground pepper', price: 30),
        Addon(name: 'Pickles', price: 80),
        Addon(name: 'Kachumbari', price: 50),
      ],
    ),
    // drinks
    Food(
      name: "Kenyan Tea",
      description:
          "It is a rich, coppery-red brew, often achieved by boiling the black tea leaves directly in a mix of milk and water until it reaches a deep, inviting amber hue ",
      imagepath: 'assets/images/beverages/tea.png',
      price: 100,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'sugar packet', price: 30),
        Addon(name: 'honey', price: 50),
        Addon(name: 'extra tea bag', price: 20),
      ],
    ),
    Food(
      name: "Dawa",
      description:
          "It is a fiery tonic built on the aromatic base of freshly boiled, pungent ginger and the bright, cutting tang of lemon juice ",
      imagepath: 'assets/images/beverages/dawa.png',
      price: 150,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'sugar packet', price: 50),
        Addon(name: 'honey', price: 50),
        Addon(name: 'extra ginger', price: 40),
      ],
    ),
    Food(
      name: "Arabica Coffee",
      description:
          "Traditional Ethiopian coffee made from beans that are roasted over an open flame ",
      imagepath: 'assets/images/splashscreen/blackcafe.jpeg',
      price: 100,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'sugar packet', price: 50),
        Addon(name: 'honey', price: 50),
        Addon(name: 'extra coffee sachet', price: 30),
      ],
    ),
    Food(
      name: "Fresh Juice",
      description: "Freshly blended from a wide variety of tropical fruits ",
      imagepath: 'assets/images/splashscreen/blackcafe.jpeg',
      price: 120,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Mocktail', price: 0),
        Addon(name: 'Mixed fruits', price: 0),
        Addon(name: 'Mango', price: 0),
      ],
    ),
    Food(
      name: "Kenyan Tea",
      description: "Bottled Soda by Coca Cola",
      imagepath: 'assets/images/splashscreen/blackcafe.jpeg',
      price: 80,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Fanta', price: 0),
        Addon(name: 'Sprite', price: 0),
        Addon(name: 'Coke', price: 0),
      ],
    ),
    //fruits
    Food(
      name: "Fruit Salad",
      description:
          " a chunky mosaic of sunny gold mango and spiky yellow pineapple, speckled with the electric green coins of kiwi and the velvety orange cubes of papaya",
      imagepath: 'assets/images/fruits/fruits.png',
      price: 150,
      category: FoodCategory.fruits,
      availableAddons: [Addon(name: "No Addons Available", price: 0)],
    ),
    Food(
      name: "Pudding",
      description:
          " a chunky mosaic of sunny gold mango and spiky yellow pineapple, speckled with the electric green coins of kiwi and the velvety orange cubes of papaya",
      imagepath: 'assets/images/fruits/fruits.png',
      price: 100,
      category: FoodCategory.fruits,
      availableAddons: [Addon(name: "No Addons Available", price: 0)],
    ),
    Food(
      name: "Green Salad",
      description:
          " Spinach,Kale and Avocado with fresh tomatoes,pickles and onions dressed with vinegear",
      imagepath: 'assets/images/fruits/fruits.png',
      price: 150,
      category: FoodCategory.fruits,
      availableAddons: [Addon(name: "Extra Vinegar", price: 50)],
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
      name: "Maandazi",
      description: "a soft, round fried dough",
      imagepath: 'assets/images/splashscreen/cafe.jpeg',
      price: 50,
      category: FoodCategory.snacks,
      availableAddons: [],
    ),
    Food(
      name: "Samosa",
      description:
          "a perfect golden-brown triangle, its crisp pastry shell with filling inside: a deeply-seasoned mixture of minced or ground beef, often studded with soft, sweet peas and tender potatoes. ,",
      imagepath: 'assets/images/assets/snacks/samosa.png',
      price: 50,
      category: FoodCategory.snacks,
      availableAddons: [
        Addon(name: "vinegar sachet", price: 20),
        Addon(name: "Option:beef", price: 10),
        Addon(name: "Option:peas", price: 0),
      ],
    ),
    //appetisers
    Food(
      name: "Butternut soup with Crusty Bread",
      description:
          " rich, creamy, and flavorful soup seasoned with nutmeg, cinnamon, sage and ginger served with Crusty Bread or Baguette ,",
      imagepath: 'assets/images/specials/roticurry.png',
      price: 50,
      category: FoodCategory.appetisers,
      availableAddons: [
        Addon(name: "fresh bun", price: 30),
        Addon(name: "Chapati (light)", price: 30),
      ],
    ),
    Food(
      name: "Pumpkin soup with Crusty Bread",
      description:
          " rich, creamy, and flavorful soup seasoned with nutmeg, cinnamon, sage and ginger served with Crusty Bread or Baguette ,",
      imagepath: 'assets/images/specials/roticurry.png',
      price: 50,
      category: FoodCategory.appetisers,
      availableAddons: [
        Addon(name: "fresh bun", price: 30),
        Addon(name: "Chapati (light)", price: 30),
      ],
    ),
    Food(
      name: "Vege rolls",
      description: " rich, crust stuffed with veges and deep fried ,",
      imagepath: 'assets/images/splashscreen/dark.png',
      price: 50,
      category: FoodCategory.appetisers,
      availableAddons: [],
    ),
    Food(
      name: "chicken rolls",
      description: "rich crust stuffed with chicken and deep fried ,",
      imagepath: 'assets/images/splashscreen/cafe.jpeg',
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
      availableAddons: [
        Addon(name: "sprinkles", price: 50),
        Addon(name: "cherries", price: 100),
        Addon(name: " crushed oreo", price: 40),
      ],
    ),
    Food(
      name: "Cake Slice",
      description: "  soft tender   ,promising a moist, fluffy bite.",
      imagepath: 'assets/images/desserts.png',
      price: 200,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "sprinkles", price: 50),
        Addon(name: "cherries", price: 100),
        Addon(name: "chocolate shavings and chips", price: 80),
      ],
    ),
    Food(
      name: "Ice cream scoup",
      description: "  soft tender   ,promising a moist, fluffy bite.",
      imagepath: 'assets/images/desserts.png',
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
      description:
          " strips of cured and often smoked pork belly or back bacon , pan-fried until the fat has rendered and the strips are crisp, wavy, and deeply caramelized",
      imagepath: 'assets/images/lunch/pilau.png',
      price: 200,
      category: FoodCategory.breakfast,
      availableAddons: [],
    ),
    Food(
      name: "English Breakfast",
      description:
          "pork sausages ,fried eggs, sweet, tangy, orange-red baked beans, A slice of thick bread",
      imagepath: 'assets/images/categories/breakfast.png',
      price: 500,
      category: FoodCategory.breakfast,
      availableAddons: [
        Addon(name: "Maandazi", price: 50),
        Addon(name: "Samosa", price: 50),
        Addon(name: "Chapati", price: 50),
      ],
    ),
    Food(
      name: "Half breakfast",
      description: " crispy bacon,potato wegdes,tea or coffee.",
      imagepath: 'assets/images/categories/breakfast.png',
      price: 300,
      category: FoodCategory.breakfast,
      availableAddons: [
        Addon(name: "Maandazi", price: 50),
        Addon(name: "Samosa", price: 50),
        Addon(name: "Sausages", price: 80),
      ],
    ),
    Food(
      name: "Half breakfast",
      description: " crispy bacon,potato wegdes,tea or coffee.",
      imagepath: 'assets/images/categories/breakfast.png',
      price: 300,
      category: FoodCategory.breakfast,
      availableAddons: [
        Addon(name: "Maandazi", price: 50),
        Addon(name: "Samosa", price: 50),
        Addon(name: "Sausages", price: 80),
      ],
    ),
  ];
  //getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //OPERATIONS
  //user cart
  final List<CartItem> _cart = [];

  //delivery address
  String _deliveryAddress = "1st Floor,ICT ";

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
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons, quantity: 1),
      );
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
  //update delivery address

  void updateDeliveryAddresss(String newAdress) {
    _deliveryAddress = newAdress;
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
    receipt.writeln("Delivery Address: $deliveryAddress");
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

import 'package:flutter/foundation.dart';
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

  //OPERATIONS
  //add to cart

  //remove from cart

  //get total price of cart

  //get total number of items in cart

  //clear cart

  //HELPERS

  //generate a receipt
  //format a double to money value
  // format list of addons into a string summary
}

//food item
class Food {
  final String name;
  final String description;
  final String imagepath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagepath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });

  // serialize Food to a Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imagepath': imagepath,
      'price': price,
      'category': category.toString().split('.').last,
      'availableAddons': availableAddons.map((a) => a.toMap()).toList(),
    };
  }

  // optional: convenience factory (if needed)
  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imagepath: map['imagepath'] ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      category: FoodCategory.values.firstWhere(
        (c) => c.toString().split('.').last == (map['category'] ?? ''),
        orElse: () => FoodCategory.lunch,
      ),
      availableAddons:
          (map['availableAddons'] as List<dynamic>?)
              ?.map((e) => Addon.fromMap(Map<String, dynamic>.from(e)))
              .toList() ??
          [],
    );
  }
}

//food categories
enum FoodCategory {
  breakfast,
  lunch,
  desserts,
  appetisers,
  snacks,
  fruits,
  drinks,
  specials,
}

//food addon
class Addon {
  String name;
  double price;
  Addon({required this.name, required this.price});

  Map<String, dynamic> toMap() {
    return {'name': name, 'price': price};
  }

  factory Addon.fromMap(Map<String, dynamic> map) {
    return Addon(
      name: map['name'] ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class CartState {
  final List<CartItem> cartItems;

  CartState({this.cartItems = const []});

  CartState copyWith({List<CartItem>? cartItems}) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
    );
  }
}

class CartItem {
  final String title;
  final double price;
  final int quantity;
  final String imagePath;
  final String description;
  final String calories;

  CartItem({
    required this.title,
    required this.price,
    required this.quantity,
    required this.imagePath,
    required this.description,
    required this.calories,
  });

  CartItem copyWith({
    int? quantity,
    double? price,
    String? description,
    String? calories,
  }) {
    return CartItem(
      title: title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imagePath: imagePath,
      description: description ?? this.description,
      calories: calories ?? this.calories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'quantity': quantity,
      'imagePath': imagePath,
      'description': description,
      'calories': calories,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      title: map['title'] ?? '',
      price: map['price'].toDouble(),
      quantity: map['quantity'] ?? 1,
      imagePath: map['imagePath'] ?? '',
      description: map['description'] ?? '',
      calories: map['calories'] ?? '',
    );
  }
}

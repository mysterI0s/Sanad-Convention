import 'package:convention/features/home/cubit/cart_state.dart';

class FavoriteMealsState {
  final List<CartItem> favoriteMeals;

  FavoriteMealsState({this.favoriteMeals = const []});

  FavoriteMealsState copyWith({List<CartItem>? favoriteMeals}) {
    return FavoriteMealsState(
      favoriteMeals: favoriteMeals ?? this.favoriteMeals,
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:convention/core/constants/app_consts.dart';
import 'package:convention/features/home/cubit/cart_state.dart';
import 'favorite_meals_state.dart';

class FavoriteMealsCubit extends Cubit<FavoriteMealsState> {
  FavoriteMealsCubit()
      : super(FavoriteMealsState(favoriteMeals: _loadFavorites()));

  static List<CartItem> _loadFavorites() {
    final storedFavorites = box.read<List>('favoriteMeals') ?? [];
    return storedFavorites
        .map((e) => CartItem.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  void toggleFavorite(CartItem meal) {
    final currentFavorites = List<CartItem>.from(state.favoriteMeals);

    if (currentFavorites.any((item) => item.title == meal.title)) {
      currentFavorites.removeWhere((item) => item.title == meal.title);
    } else {
      currentFavorites.add(meal);
    }
    box.write('favoriteMeals', currentFavorites.map((e) => e.toMap()).toList());

    emit(FavoriteMealsState(favoriteMeals: currentFavorites));
  }
}

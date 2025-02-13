import 'package:convention/core/constants/app_strings.dart';
import 'package:convention/core/services/notification_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void addToCart(CartItem item) {
    final existingItemIndex = state.cartItems.indexWhere(
      (cartItem) => cartItem.title == item.title,
    );

    if (existingItemIndex != -1) {
      final updatedItems = List<CartItem>.from(state.cartItems);
      final existingItem = updatedItems[existingItemIndex];

      updatedItems[existingItemIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + item.quantity,
      );

      emit(CartState(cartItems: updatedItems));
    } else {
      emit(CartState(cartItems: [...state.cartItems, item]));
    }
  }

  void removeFromCart(CartItem item) {
    final updatedItems = state.cartItems
        .map((cartItem) {
          if (cartItem.title == item.title && cartItem.quantity > 0) {
            return cartItem.copyWith(quantity: cartItem.quantity - 1);
          }
          return cartItem;
        })
        .where((cartItem) => cartItem.quantity > 0)
        .toList();

    emit(CartState(cartItems: updatedItems));
  }

  void deleteFromCart(CartItem item) {
    final updatedItems = state.cartItems
        .where((cartItem) => cartItem.title != item.title)
        .toList();
    emit(CartState(cartItems: updatedItems));
  }

  void clearCart() {
    emit(state.copyWith(cartItems: []));
  }

  void scheduleOrderNotification() {
    NotificationService.scheduleNotification(
      id: 0,
      title: AppStrings.orderUpdate.tr(),
      body: AppStrings.foodArrived.tr(),
      scheduledTime: DateTime.now().add(Duration(minutes: 1)),
    );
  }

  double getTotalPrice() {
    return state.cartItems
        .fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}

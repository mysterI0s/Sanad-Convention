import 'package:convention/features/meals_details/cubit/meals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MealCubit extends Cubit<MealState> {
  MealCubit(double initialPrice)
      : super(MealState(quantity: 1, totalPrice: initialPrice));

  void increment(double itemPrice) {
    emit(MealState(
      quantity: state.quantity + 1,
      totalPrice: (state.quantity + 1) * itemPrice,
    ));
  }

  void decrement(double itemPrice) {
    if (state.quantity > 1) {
      emit(MealState(
        quantity: state.quantity - 1,
        totalPrice: (state.quantity - 1) * itemPrice,
      ));
    }
  }
}

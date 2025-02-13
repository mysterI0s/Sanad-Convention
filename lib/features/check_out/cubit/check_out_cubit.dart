import 'package:flutter_bloc/flutter_bloc.dart';
import 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit(double cartTotal) : super(CheckOutState(cartTotal: cartTotal));

  void applyDiscount(String code) {
    if (code == "NOVA100") {
      emit(state.copyWith(discountCode: code, discount: 10.0));
    } else {
      emit(state.copyWith(discountCode: code, discount: 0.0));
    }
  }

  void selectPaymentMethod(String method) {
    emit(state.copyWith(selectedPaymentMethod: method));
  }
}

import 'package:equatable/equatable.dart';

class CheckOutState extends Equatable {
  final double cartTotal;
  final String discountCode;
  final double discount;
  final String selectedPaymentMethod;

  const CheckOutState({
    required this.cartTotal,
    this.discountCode = '',
    this.discount = 0.0,
    this.selectedPaymentMethod = '',
  });

  double get totalPayment => (cartTotal - discount) + 10 + 5;

  CheckOutState copyWith({
    double? cartTotal,
    String? discountCode,
    double? discount,
    String? selectedPaymentMethod,
  }) {
    return CheckOutState(
      cartTotal: cartTotal ?? this.cartTotal,
      discountCode: discountCode ?? this.discountCode,
      discount: discount ?? this.discount,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
    );
  }

  @override
  List<Object> get props =>
      [cartTotal, discountCode, discount, selectedPaymentMethod];
}

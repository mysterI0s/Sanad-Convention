import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CouponCubit extends Cubit<int> {
  CouponCubit(this.pageController) : super(0) {
    _startAutoSwipe();
  }

  final PageController pageController;
  final int _totalCoupons = 2;
  Timer? _timer;

  void _startAutoSwipe() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      int nextIndex = (state + 1) % _totalCoupons;
      pageController.animateToPage(
        nextIndex + 1000,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      emit(nextIndex);
    });
  }

  void updatePage(int index) {
    emit(index % _totalCoupons);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingState {
  final int currentPage;

  const OnboardingState({required this.currentPage});
}

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(currentPage: 0));

  void updatePage(int newPage) {
    emit(OnboardingState(currentPage: newPage));
  }

  void nextPage() {
    emit(OnboardingState(currentPage: state.currentPage + 1));
  }
}

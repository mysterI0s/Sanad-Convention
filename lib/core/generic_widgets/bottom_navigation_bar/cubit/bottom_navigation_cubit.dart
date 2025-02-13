import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState(selectedIndex: 0));

  void changePageIndex(int newIndex) {
    emit(BottomNavigationState(selectedIndex: newIndex));
  }
}

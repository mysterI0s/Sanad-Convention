import 'package:convention/core/generic_widgets/category_widget/cubit/category_widget_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState(selectedIndex: 0));

  void selectCategory(int index) {
    emit(CategoryState(selectedIndex: index));
  }
}

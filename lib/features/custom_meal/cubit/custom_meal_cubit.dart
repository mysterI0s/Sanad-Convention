import 'package:bloc/bloc.dart';
import 'package:convention/features/custom_meal/cubit/custom_meal_state.dart';

class CustomMealCubit extends Cubit<CustomMealState> {
  CustomMealCubit() : super(CustomMealState());

  void selectFood(String category, String foodItem) {
    final updatedSelection =
        Map<String, List<String>>.from(state.selectedFoodItems);
    List<String> updatedList =
        List<String>.from(updatedSelection[category] ?? []);

    if (updatedList.contains(foodItem)) {
      updatedList.remove(foodItem);
    } else {
      updatedList.add(foodItem);
    }

    updatedSelection[category] = updatedList;

    emit(state.copyWith(selectedFoodItems: updatedSelection));
  }
}

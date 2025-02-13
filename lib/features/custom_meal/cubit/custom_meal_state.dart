import 'package:equatable/equatable.dart';

class CustomMealState extends Equatable {
  final Map<String, List<String>> selectedFoodItems;

  const CustomMealState({this.selectedFoodItems = const {}});

  CustomMealState copyWith({Map<String, List<String>>? selectedFoodItems}) {
    return CustomMealState(
      selectedFoodItems: selectedFoodItems ?? this.selectedFoodItems,
    );
  }

  @override
  List<Object> get props => [selectedFoodItems];
}

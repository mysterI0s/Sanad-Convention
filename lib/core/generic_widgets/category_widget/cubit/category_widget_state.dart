import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  final int selectedIndex;

  const CategoryState({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}
  
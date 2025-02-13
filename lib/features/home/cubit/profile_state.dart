import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileImageUpdated extends ProfileState {
  final String imagePath;

  const ProfileImageUpdated(this.imagePath);

  @override
  List<Object?> get props => [imagePath];
}

part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSetState extends ProfileState {
  const ProfileSetState(
    this.isEditing,
    this.cardsExpanded,
    this.ordersExpanded,
  );

  final bool isEditing;
  final bool cardsExpanded;
  final bool ordersExpanded;

  @override
  List<Object> get props => [isEditing, cardsExpanded, ordersExpanded];
}

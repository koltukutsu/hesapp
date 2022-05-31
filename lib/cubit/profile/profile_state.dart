part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileEditModeState extends ProfileState {
  const ProfileEditModeState(this.isEditing);

  final bool isEditing;

  @override
  List<Object> get props => [isEditing];
}

class ProfileCardListState extends ProfileState {
  const ProfileCardListState(this.cardListExpanded);

  final bool cardListExpanded;

  @override
  List<Object?> get props => [cardListExpanded];
}

class ProfileOrderListState extends ProfileState {
  const ProfileOrderListState(this.orderListExpanded);

  final bool orderListExpanded;

  @override
  List<Object?> get props => [orderListExpanded];
}

class ProfileOrderListLoaded extends ProfileState {
  const ProfileOrderListLoaded(this.orderList);

  final List<Order> orderList;

  @override
  List<Object?> get props => [orderList];
}

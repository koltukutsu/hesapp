import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/data/repository/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _preferencesRepository;

  ProfileCubit(this._preferencesRepository) : super(ProfileInitial());

  bool isEditing = false;
  bool cardListExpanded = false;
  bool orderListExpanded = false;

  Future<List<Order>> fetchOrderHistory() {
    return _preferencesRepository.fetchOrderHistory();
  }

  toggleEditMode() {
    isEditing = !isEditing;
    emit(ProfileEditModeState(isEditing));
  }

  toggleSavedCards() {
    cardListExpanded = !cardListExpanded;
    emit(ProfileCardListState(cardListExpanded));
  }

  toggleOrderHistory() {
    orderListExpanded = !orderListExpanded;
    emit(ProfileOrderListState(orderListExpanded));
  }
}

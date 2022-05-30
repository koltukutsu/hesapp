import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/repository/preferences_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileSetState> {
  PreferencesRepository _preferencesRepository;

  ProfileCubit(this._preferencesRepository)
      : super(const ProfileSetState(false, false, false));

  bool isEditing = false;
  bool cardsExpanded = false;
  bool ordersExpanded = false;

  toggleEditMode() {
    isEditing = !isEditing;
    emit(ProfileSetState(isEditing, cardsExpanded, ordersExpanded));
  }

  toggleSavedCards() {
    cardsExpanded = !cardsExpanded;
    emit(ProfileSetState(isEditing, cardsExpanded, ordersExpanded));
  }

  toggleOrderHistory() {
    ordersExpanded = !ordersExpanded;
    emit(ProfileSetState(isEditing, cardsExpanded, ordersExpanded));
  }
}

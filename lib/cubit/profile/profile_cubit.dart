import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/data/repository/auth_repository.dart';
import 'package:hesap/data/repository/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;
  final AuthRepository _authRepository;
  ProfileCubit(this._profileRepository, this._authRepository)
      : super(ProfileInitial());

  bool isEditing = false;
  bool savedCardsExpanded = false;
  bool orderHistoryExpanded = false;

  String name = "";
  String username = "";
  String email = "";
  String phone = "";

  setName(String value) {
    name = value;
  }

  setUsername(String value) {
    username = value;
  }

  setEmail(String value) {
    email = value;
  }

  setPhone(String value) {
    phone = value;
  }

  toggleEditMode() {
    try {
      if (isEditing) {
        _updateProfile();
      }
      isEditing = !isEditing;
      emit(state);
    } catch (error) {
      emit(ProfileError(error.toString()));
    }
  }

  toggleSavedCards() {
    savedCardsExpanded = !savedCardsExpanded;
    emit(state);
  }

  toggleOrderHistory() {
    orderHistoryExpanded = !orderHistoryExpanded;
    emit(state);
  }

  _updateProfile() async {
    HesapUser? hesapUser = await _authRepository.getHesapUser();
    _profileRepository.updateProfile(
      HesapUser(
        id: hesapUser!.id,
        name: name,
        username: username,
        email: email,
        phone: phone,
      ),
    );
  }

  signOut() {
    _authRepository.signOut();
  }

  setInitialValues(HesapUser hesapUser) {
    name = hesapUser.name;
    username = hesapUser.username;
    email = hesapUser.email;
    phone = hesapUser.phone;
  }
}

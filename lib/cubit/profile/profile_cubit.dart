import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/data/repository/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileCubit(this._profileRepository) : super(ProfileInitial());

  bool isEditing = false;

  toggleEditMode({HesapUser? updatedHesapUser}) {
    try {
      if (isEditing && updatedHesapUser != null) {
        updateProfile(updatedHesapUser);
      }
      isEditing = !isEditing;
      emit(ProfileSuccessful(isEditing));
    } catch (error) {
      emit(ProfileError(error.toString()));
    }
  }

  updateProfile(HesapUser updatedHesapUser) {
    _profileRepository.updateProfile(updatedHesapUser);
  }
}

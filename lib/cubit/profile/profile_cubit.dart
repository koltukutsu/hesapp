import 'package:bloc/bloc.dart';
import 'package:hesap/data/repository/preferences_repository.dart';

class ProfileCubit extends Cubit<bool> {
  PreferencesRepository _profileRepository;

  ProfileCubit(this._profileRepository) : super(false);

  bool isEditing = false;

  toggleEditMode() {
    isEditing = !isEditing;
    emit(isEditing);
  }
}

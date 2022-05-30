import 'package:bloc/bloc.dart';

class ProfileCubit extends Cubit<bool> {
  ProfileCubit() : super(false);

  bool isEditing = false;

  toggleEditMode() {
    emit(!isEditing);
    isEditing = !isEditing;
  }
}

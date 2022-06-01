import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<bool> {
  ProfileCubit() : super(false);

  bool isEditing = false;

  toggleEditMode() {
    isEditing = !isEditing;
    emit(isEditing);
  }
}

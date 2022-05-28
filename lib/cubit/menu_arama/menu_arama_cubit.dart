import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part "menu_arama_state.dart";

class MenuAramaCubit extends Cubit<MenuAramaState> {
  MenuAramaCubit() : super(const MenuAramaState(""));

  void setInputValue(String value) {
    if (value.isNotEmpty) {
      emit(MenuAramaState(value));
    }
  }
}

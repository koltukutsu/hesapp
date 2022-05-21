import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/colors.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.lightBackground,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.darkBackground,
  );

  toggleTheme() {
    emit(state.brightness == Brightness.dark ? lightTheme : darkTheme);
  }
}

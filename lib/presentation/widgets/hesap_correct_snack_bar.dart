import 'package:flutter/material.dart';
import 'package:hesap/presentation/theme/colors.dart';
import 'package:hesap/presentation/theme/insets.dart';

SnackBar correctSnackbar(String message) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    padding: const EdgeInsets.all(Insets.l),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(Insets.m))),
    elevation: 0,
    backgroundColor: AppColors.accept,
    content: Text(message),
  );
}

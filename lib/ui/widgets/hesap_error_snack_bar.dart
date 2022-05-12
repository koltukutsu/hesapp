import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/colors.dart';

SnackBar errorSnackbar(String error) {
  return SnackBar(
    backgroundColor: AppColors.primary,
    content: Text(error),
  );
}

import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.maxLength,
    required this.enabled,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final int? maxLength;
  final Icon? suffixIcon;
  final Function(String) onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Insets.s),
            borderSide: const BorderSide(
              color: AppColors.gray,
              width: 1.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Insets.s),
            borderSide: const BorderSide(
              color: AppColors.gray,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Insets.s),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 1.0,
            ),
          ),
          enabled: enabled,
          suffixIcon: suffixIcon,
          prefixStyle: const TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 16.0,
          ),
          labelText: label,
          labelStyle: const TextStyle(
            fontFamily: 'Ubuntu',
          ),
          hintStyle: const TextStyle(
            color: AppColors.gray,
          ),
          isDense: false,
          filled: true,
          fillColor: Theme.of(context).backgroundColor,
          contentPadding: const EdgeInsets.fromLTRB(20, 24, 12, 8),
          counterText: "",
        ),
        keyboardType: keyboardType,
        style: const TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 16.0,
          letterSpacing: 0.2,
        ),
        maxLength: maxLength,
        onChanged: onChanged,
      ),
    );
  }
}

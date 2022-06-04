import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

class HesapTextFieldSuffix extends StatelessWidget {
  const HesapTextFieldSuffix({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.maxLength,
    this.borderColor = AppColors.primary,
  }) : super(key: key);

  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLength;
  final Icon? suffixIcon;
  final Function(String) onChanged;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Insets.m),
            borderSide: BorderSide(
              color: borderColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Insets.m),
            borderSide: BorderSide(
              color: borderColor,
              width: 1.0,
            ),
          ),
          suffixIcon: suffixIcon,
          suffixStyle: const TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 16.0,
          ),
          hintText: hint,
          labelStyle: TextStyle(fontFamily: 'Ubuntu', color: borderColor),
          hintStyle: const TextStyle(
            color: AppColors.gray,
          ),
          isDense: false,
          filled: true,
          fillColor: Colors.white,
          counterText: "",
        ),
        keyboardType: keyboardType,
        style: TextStyle(
          color: borderColor,
          fontFamily: 'Ubuntu',
          fontSize: 16.0,
          letterSpacing: 0.2,
        ),
        obscureText: obscureText,
        maxLength: maxLength,
        onChanged: onChanged,
      ),
    );
  }
}

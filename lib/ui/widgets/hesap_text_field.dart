import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/insets.dart';

class HesapTextField extends StatelessWidget {
  const HesapTextField({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.maxLength,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLength;
  final Icon? prefixIcon;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Insets.s),
            borderSide: const BorderSide(
              color: AppColors.gray,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Insets.s),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 2.0,
            ),
          ),
          prefixIcon: prefixIcon,
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
        obscureText: obscureText,
        maxLength: maxLength,
        onChanged: onChanged,
      ),
    );
  }
}

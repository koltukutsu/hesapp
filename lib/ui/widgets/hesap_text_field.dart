import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/insets.dart';

class HesapTextField extends StatefulWidget {
  HesapTextField(
      {Key? key,
      required this.label,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.maxLength,
      required this.onChanged,
      this.suffixIcon,
      this.passwordShow = false,
      this.hintText = ""
      })
      : super(key: key);

  final String label;
  bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final int? maxLength;
  final Icon? prefixIcon;
  final Function(String) onChanged;
  final bool? suffixIcon;
  final bool passwordShow;

  @override
  State<HesapTextField> createState() => _HesapTextFieldState();
}

class _HesapTextFieldState extends State<HesapTextField> {
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
          suffixIcon: widget.suffixIcon == true
              ? IconButton(
                  icon: widget.obscureText == true
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      if (widget.passwordShow == true) {
                        widget.obscureText = !widget.obscureText;
                      }
                    });
                  })
              : null,
          prefixIcon: widget.prefixIcon,
          prefixStyle: const TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 16.0,
          ),
          labelText: widget.label,
          labelStyle: const TextStyle(
            fontFamily: 'Ubuntu',
          ),
          hintText: widget.hintText == "" ? null : widget.hintText,
          hintStyle: const TextStyle(
            color: AppColors.gray,
          ),
          isDense: false,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 24, 12, 8),
          counterText: "",
        ),
        keyboardType: widget.keyboardType,
        style: const TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 16.0,
          letterSpacing: 0.2,
        ),
        obscureText: widget.obscureText,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
      ),
    );
  }
}

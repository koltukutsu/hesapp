// necessary
import 'package:flutter/material.dart';
// theme
import 'package:hesap/theme/colors.dart';
import 'package:hesap/theme/insets.dart';

class HesapNormalText extends StatelessWidget {
  /*
    Renk -> primary
    fontSize -> L
    fontWeight -> w700
   */
  const HesapNormalText({
    Key? key,
    required this.text,
    this.textColor = AppColors.primary,
    this.fontSize = Insets.l,
    this.fontWeight = FontWeight.w700,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Ubuntu',
          fontWeight: fontWeight,
          color: textColor,
          fontSize: fontSize,
          letterSpacing: -2,
        ),
      ),
    );
  }
}

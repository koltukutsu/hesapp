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
    required this.label,
    this.labelColor = AppColors.primary,
    this.fontSize = Insets.l,
    this.fontWeight = FontWeight.w700,
  }) : super(key: key);

  final String label;
  final Color labelColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Ubuntu',
          fontWeight: fontWeight,
          color: labelColor,
          fontSize: fontSize,
          letterSpacing: -2,
        ),
      ),
    );
  }
}

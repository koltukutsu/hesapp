// necessary
import 'package:flutter/material.dart';

// components
import 'package:hesap/components/hesap_normal_text.dart';

// theme
import 'package:hesap/theme/insets.dart';
import 'package:hesap/theme/colors.dart';

class HesapTextCard extends StatelessWidget {
  const HesapTextCard(
      {Key? key,
      required this.text,
      this.textColor = AppColors.primary,
      this.fontSize = Insets.l,
      this.fontWeight = FontWeight.w700,
      this.cardColor = AppColors.primary,
      this.cardHeight = 100,
      this.cardWidth = 200,
      this.marginLeft = 15,
      this.marginRight = 15,
      this.marginTop = 15,
      this.marginBottom = 15})
      : super(key: key);

  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Color cardColor;
  final double cardHeight;
  final double cardWidth;
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HesapNormalText(
          text: text,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight),
      margin: EdgeInsets.only(
          left: marginLeft,
          top: marginTop,
          right: marginRight,
          bottom: marginBottom),
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

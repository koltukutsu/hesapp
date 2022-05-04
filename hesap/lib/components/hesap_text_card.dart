import 'package:flutter/material.dart';

import 'package:hesap/components/hesap_normal_text.dart';
import 'package:hesap/theme/colors.dart';

class HesapTextCard extends StatelessWidget {
  const HesapTextCard(
      {Key? key,
      required this.label,
      this.cardHeight = 100,
      this.cardWidth = 200,
      this.marginLeft = 15,
      this.marginRight = 15,
      this.marginTop = 15,
      this.marginBottom = 15})
      : super(key: key);
  final String label;
  final double cardHeight;
  final double cardWidth;
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HesapNormalText(label: label),
      margin: EdgeInsets.only(
          left: marginLeft,
          top: marginTop,
          right: marginRight,
          bottom: marginBottom),
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        color: AppColors.primary,
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

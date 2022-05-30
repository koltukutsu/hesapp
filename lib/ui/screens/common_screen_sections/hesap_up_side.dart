// necessary
import 'package:flutter/material.dart';
import 'package:hesap/ui/widgets/HesapSearch.dart';
// components
import 'package:hesap/ui/widgets/hesap_text_card.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';
// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

class HesapUpSide extends StatelessWidget {
  const HesapUpSide({
    Key? key,
    this.mekanIsmi = "Kafe 24",
    this.secondText = "Masa 24",
    this.yukariUzunluk = 100,
  }) : super(key: key);

  final String mekanIsmi;
  final String secondText;
  final double yukariUzunluk;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: yukariUzunluk,
        ),
        HesapNormalText(
            text: mekanIsmi,
            fontSize: Insets.xll,
            textColor: AppColors.primary),
        const SizedBox(
          height: 20,
        ),
        HesapTextCard(
          text: secondText,
          fontSize: Insets.xll,
          textColor: AppColors.lightBackground,
          cardColor: AppColors.primary,
        ),
        // HesapSearch()
      ],
    ));
  }
}

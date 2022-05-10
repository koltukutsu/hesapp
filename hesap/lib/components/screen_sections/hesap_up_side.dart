// necessary
import 'package:flutter/material.dart';
// components
import 'package:hesap/components/elements/metin_kart.dart';
import 'package:hesap/components/elements/normal_metin.dart';
// theme
import 'package:hesap/theme/colors.dart';
import 'package:hesap/theme/insets.dart';


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
    // var secondText = "Menu";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: yukariUzunluk,
        ),
        NormalMetin(
            text: mekanIsmi,
            fontSize: Insets.xll,
            textColor: AppColors.primary),
        const SizedBox(
          height: 20,
        ),
        MetinKart(
          text: secondText,
          fontSize: Insets.xll,
          textColor: AppColors.lightBackground,
          cardColor: AppColors.primary,
        ),
      ],
    );
  }
}

// necessary
import 'package:flutter/material.dart';

// components
import 'package:hesap/components/hesap_text_card.dart';

// theme
import 'package:hesap/theme/colors.dart';
import 'package:hesap/theme/insets.dart';

import 'hesap_normal_text.dart';

class HesapMiddleSide extends StatelessWidget {
  const HesapMiddleSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstText = "Corbalar";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          child: HesapTextCard(
            text: firstText,
            fontSize: Insets.l,
            textColor: AppColors.darkBackground,
            textAlignment: Alignment.centerLeft,
            cardColor: AppColors.gray,
            cardWidth: 500,
            cardHeight: 40,
            paddingLeft: 15,
          ),
        )
      ],
    );
  }
}

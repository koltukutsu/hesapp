// necessary
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hesap/ui/widgets/HesapSearch.dart';
import 'package:hesap/ui/widgets/background.dart';
// components
import 'package:hesap/ui/widgets/hesap_text_card.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';
// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';


class HesapUpSideWithSearch extends StatelessWidget {
  const HesapUpSideWithSearch({
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
      // alignment: AlignmentDirectional.topEnd,
      // fit: StackFit.loose,
      children: [
        SizedBox(
          height: yukariUzunluk,
        ),
        // Transform.scale(
        //   scale: 1.05,
        //   child: ClipRRect(
        //     borderRadius: const BorderRadius.only(
        //       bottomLeft: Radius.circular(70),
        //       bottomRight: Radius.circular(70),
        //     ),
        //     child: Container(
        //       width: MediaQuery.of(context).size.width,
        //       height: 210,
        //       color: AppColors.primary,
        //     ),
        //   ),
        // ),
        // SvgPicture.asset('assets/images/background.svg'), // HesapBackGround(),
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
        HesapSearch()
      ],
    );
  }
}

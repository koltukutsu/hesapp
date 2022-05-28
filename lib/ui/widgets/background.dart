import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hesap/ui/theme/colors.dart';

class HesapBackGround extends StatelessWidget {
  const HesapBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.scale(
          scale: 1.05,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              color: AppColors.primary,
            ),
          ),
        ),
        SvgPicture.asset('assets/images/background.svg'),
      ],
    );
  }
}

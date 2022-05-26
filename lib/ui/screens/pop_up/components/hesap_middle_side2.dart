// necessary
import 'package:flutter/material.dart';

// components
// import 'package:hesap/ui/widgets/hesap_image_card.dart';
import 'package:hesap/ui/widgets/hesap_text_card.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

class HesapMiddleSide2 extends StatelessWidget {
  // TODO: text ve cardin oldugu kisim ScreenSection icine alinabilir.
  const HesapMiddleSide2({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HesapTextCard(
          text: data["Masa Ismi"],
          fontSize: Insets.l,
          textColor: AppColors.darkBackground,
          textAlignment: Alignment.centerLeft,
          fontWeight: FontWeight.w600,
          cardColor: Colors.grey.shade300,
          cardWidth: 500,
          cardHeight: 40,
          paddingLeft: 15,
          marginTop: 0,
          marginBottom: 3,
          marginLeft: 0,
          marginRight: 0,
          cardCircularBottomLeft: 0,
          cardCircularBottomRight: 0,
          cardCircularTopLeft: 0,
          cardCircularTopRight: 0,
          cardBlurRadius: 0,
          cardShadowColorOpacity: 0,
          cardSpreadRadius: 0,
        ),
        Column(
          children: List.generate(
            data["kisiler"].length,
            (innerIndex) => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Container(
                    height: 46,
                    width: 46,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child:
                        const Icon(Icons.person_rounded, color: Colors.white),
                    alignment: Alignment.center,
                  ),
                ),
                HesapTextCard(
                  text: data["kisiler"][innerIndex]["ismi"],
                  fontSize: Insets.l,
                  textColor: AppColors.darkBackground,
                  fontWeight: FontWeight.w200,
                  textAlignment: Alignment.centerLeft,
                  cardColor: AppColors.white,
                  cardWidth: 320,
                  cardHeight: 50,
                  paddingLeft: 0,
                  marginTop: 0,
                  marginBottom: 0,
                  marginLeft: 0,
                  marginRight: 0,
                  cardCircularBottomLeft: 0,
                  cardCircularBottomRight: 0,
                  cardCircularTopLeft: 0,
                  cardCircularTopRight: 0,
                  cardBlurRadius: 0,
                  cardShadowColorOpacity: 0,
                  cardSpreadRadius: 0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

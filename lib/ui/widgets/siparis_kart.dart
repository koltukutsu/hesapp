// necessary
import 'package:flutter/material.dart';

// components
import 'package:hesap/ui/widgets/hesap_normal_text.dart';

// theme
import 'package:hesap/ui/theme/insets.dart';
import 'package:hesap/ui/theme/colors.dart';

class HesapOrderCard extends StatelessWidget {
  // TODO: card radius.circular kisimlarini da kullanicidan alsin
  const HesapOrderCard({
    Key? key,
    required this.text,
    this.imageSiparisUrl =
        "https://cdn.yemek.com/mnresize/940/940/uploads/2014/06/mercimek-corbasi-yemekcom.jpg",
    this.priceSiparis = "20",
    this.durationSiparis = "10-20",
    this.textColor = AppColors.primary,
    this.fontSize = Insets.l,
    this.textAlignment = Alignment.center,
    this.fontWeight = FontWeight.w700,
    this.paddingLeft = 0.0,
    this.paddingTop = 0.0,
    this.paddingRight = 0.0,
    this.paddingBottom = 0.0,
    this.cardColor = AppColors.primary,
    this.cardShadowColorOpacity = 0.5,
    this.cardWidth = 250,
    this.cardCircularTopLeft = 10,
    this.cardCircularTopRight = 10,
    this.cardCircularBottomLeft = 10,
    this.cardCircularBottomRight = 10,
    this.marginLeft = 15,
    this.marginRight = 15,
    this.marginTop = 15,
    this.marginBottom = 15,
    this.cardShadowColor = Colors.grey,
    this.cardSpreadRadius = 5,
    this.cardBlurRadius = 7,
    this.cardOffset = const Offset(0, 3),
  }) : super(key: key);

  final String text;

  final String imageSiparisUrl;
  final String priceSiparis;
  final String durationSiparis;

  final Color textColor;
  final Alignment textAlignment;
  final double fontSize;
  final FontWeight fontWeight;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;

  final Color cardColor;
  final double cardWidth;
  final double cardCircularTopLeft;
  final double cardCircularTopRight;
  final double cardCircularBottomLeft;
  final double cardCircularBottomRight;

  final Color cardShadowColor;
  final double cardShadowColorOpacity;
  final double cardSpreadRadius;
  final double cardBlurRadius;
  final Offset cardOffset;

  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                imageSiparisUrl,
                width: 100,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HesapNormalText(
                    text: text,
                    textColor: textColor,
                    fontSize: Insets.l,
                    fontWeight: FontWeight.w600,
                  ),
                  HesapNormalText(
                    text: "$durationSiparis dk",
                    fontSize: Insets.m,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.gray,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  HesapNormalText(
                    text: "$priceSiparis TL",
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.darkBackground,
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {}, // sepete ekleme burada yapilacak
                icon: const Icon(
                  Icons.add_box_rounded,
                  color: AppColors.primary,
                  size: Insets.xll,
                )),
          ],
        ),
      ),
      margin: EdgeInsets.only(
        left: marginLeft,
        top: marginTop,
        right: marginRight,
        bottom: marginBottom,
      ),
      width: cardWidth,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cardCircularTopLeft),
          topRight: Radius.circular(cardCircularTopRight),
          bottomLeft: Radius.circular(cardCircularBottomLeft),
          bottomRight: Radius.circular(cardCircularBottomRight),
        ),
        boxShadow: [
          BoxShadow(
            color: cardShadowColor.withOpacity(cardShadowColorOpacity),
            spreadRadius: cardSpreadRadius,
            blurRadius: cardBlurRadius,
            offset: cardOffset, // changes position of shadow
          ),
        ],
      ),
    );
  }
}

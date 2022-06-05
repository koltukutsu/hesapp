// necessary
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/sepet/sepet_cubit.dart';
import 'package:hesap/data/model/product.dart';

// components
import 'package:hesap/ui/widgets/hesap_normal_text.dart';

// theme
import 'package:hesap/ui/theme/insets.dart';
import 'package:hesap/ui/theme/colors.dart';

class HesapOrderCardCustom extends StatelessWidget {
  // TODO: card radius.circular kisimlarini da kullanicidan alsin
  const HesapOrderCardCustom({
    Key? key,
    required this.product,
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
    this.cardHeight = 100,
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

  final Product product;
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
  final double cardHeight;
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                imageSiparisUrl,
                height: 91,
                width: 131,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0.0),
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
                  text: durationSiparis + " dk",
                  fontSize: Insets.m,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.gray,
                ),
                const SizedBox(
                  height: 12,
                ),
                HesapNormalText(
                  text: priceSiparis.toString() + "  TL",
                  fontSize: Insets.l,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.darkBackground,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AnimatedIconButton(
              size: 36,
              onPressed: () {
                context.read<SepetCubit>().addToCart(product);
              },
              duration: const Duration(milliseconds: 1000),
              splashColor: Colors.transparent,
              icons: const <AnimatedIconItem>[
                AnimatedIconItem(
                  icon:
                      Icon(Icons.add_circle_rounded, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(
          left: marginLeft,
          top: marginTop,
          right: marginRight,
          bottom: marginBottom),
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardCircularTopLeft),
            topRight: Radius.circular(cardCircularTopRight),
            bottomLeft: Radius.circular(cardCircularBottomLeft),
            bottomRight: Radius.circular(cardCircularBottomRight)),
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

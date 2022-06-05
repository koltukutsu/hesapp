// necessary
import 'package:flutter/material.dart';
import 'package:hesap/data/model/product.dart';
import 'package:hesap/ui/screens/menu/components/siparis_kart_custom.dart';

// components
import 'package:hesap/ui/widgets/hesap_text_card.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

class HesapMiddleSide extends StatelessWidget {
  // TODO: text ve cardin oldugu kisim ScreenSection icine alinabilir.
  const HesapMiddleSide({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, List<Product>> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        data.length, // kategori uzunluklari kadar
        (index) => Column(
          children: [
            HesapTextCard(
              text: data.keys.elementAt(index),
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
                data.values.elementAt(index).length,
                (innerIndex) => HesapOrderCardCustom(
                  text: data.values.elementAt(index)[innerIndex].title,
                  durationSiparis:
                      data.values.elementAt(index)[innerIndex].duration,
                  priceSiparis:
                      data.values.elementAt(index)[innerIndex].price.toString(),
                  imageSiparisUrl:
                      data.values.elementAt(index)[innerIndex].image,
                  fontSize: Insets.l,
                  textColor: AppColors.darkBackground,
                  fontWeight: FontWeight.w200,
                  textAlignment: Alignment.topLeft,
                  cardColor: AppColors.white,
                  cardWidth: 500,
                  cardHeight: 100,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

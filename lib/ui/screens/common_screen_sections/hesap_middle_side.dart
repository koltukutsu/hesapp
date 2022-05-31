// necessary
import 'package:flutter/material.dart';

// components
import 'package:hesap/ui/widgets/siparis_kart.dart';
import 'package:hesap/ui/widgets/hesap_text_card.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

class HesapMiddleSide extends StatefulWidget {
  // TODO: text ve cardin oldugu kisim ScreenSection icine alinabilir.
  const HesapMiddleSide({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  State<HesapMiddleSide> createState() => _HesapMiddleSideState();
}

class _HesapMiddleSideState extends State<HesapMiddleSide> {
  @override
  Widget build(BuildContext context) {

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
                widget.data["Menu"].length,
                (index) => Column(
                      children: [
                        HesapTextCard(
                          text: widget.data["Menu"][index]["ismi"],
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
                            widget.data["Menu"][index]["elemanlar"].length,
                            (innerIndex) => HesapOrderCard(
                              text: widget.data["Menu"][index]["elemanlar"][innerIndex]
                                  ["ismi"],
                              durationSiparis: widget.data["Menu"][index]["elemanlar"]
                                  [innerIndex]["sure"],
                              priceSiparis: widget.data["Menu"][index]["elemanlar"]
                                  [innerIndex]["fiyat"],
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
                    )
            )
        );}
      ),
    );
  }
}

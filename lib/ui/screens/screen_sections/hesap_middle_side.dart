// // necessary
// import 'package:flutter/material.dart';
//
// // components
// import 'package:hesap/components/elements/siparis_kart.dart';
// import 'package:hesap/components/elements/metin_kart.dart';
//
// // theme
// import 'package:hesap/theme/colors.dart';
// import 'package:hesap/theme/insets.dart';
//
// class HesapMiddleSide extends StatelessWidget {
//   // TODO: text ve cardin oldugu kisim ScreenSection icine alinabilir.
//   const HesapMiddleSide({
//     Key? key,
//     required this.data,
//   }) : super(key: key);
//
//   final Map data;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: List.generate(
//             data["Menu"].length,
//             (index) => Column(
//                   children: [
//                     MetinKart(
//                       text: data["Menu"][index]["ismi"],
//                       fontSize: Insets.l,
//                       textColor: AppColors.darkBackground,
//                       textAlignment: Alignment.centerLeft,
//                       fontWeight: FontWeight.w600,
//                       cardColor: Colors.grey.shade300,
//                       cardWidth: 500,
//                       cardHeight: 40,
//                       paddingLeft: 15,
//                       marginTop: 0,
//                       marginBottom: 3,
//                       marginLeft: 0,
//                       marginRight: 0,
//                       cardCircularBottomLeft: 0,
//                       cardCircularBottomRight: 0,
//                       cardCircularTopLeft: 0,
//                       cardCircularTopRight: 0,
//                       cardBlurRadius: 0,
//                       cardShadowColorOpacity: 0,
//                       cardSpreadRadius: 0,
//                     ),
//                     Column(
//                       children: List.generate(
//                         data["Menu"][index]["elemanlar"].length,
//                         (innerIndex) => SiparisKart(
//                           text: data["Menu"][index]["elemanlar"][innerIndex]
//                               ["ismi"],
//                           durationSiparis: data["Menu"][index]["elemanlar"]
//                               [innerIndex]["sure"],
//                           priceSiparis: data["Menu"][index]["elemanlar"]
//                               [innerIndex]["fiyat"],
//                           fontSize: Insets.l,
//                           textColor: AppColors.darkBackground,
//                           fontWeight: FontWeight.w200,
//                           textAlignment: Alignment.topLeft,
//                           cardColor: AppColors.white,
//                           cardWidth: 500,
//                           cardHeight: 100,
//                           paddingLeft: 0,
//                           marginTop: 0,
//                           marginBottom: 0,
//                           marginLeft: 0,
//                           marginRight: 0,
//                           cardCircularBottomLeft: 0,
//                           cardCircularBottomRight: 0,
//                           cardCircularTopLeft: 0,
//                           cardCircularTopRight: 0,
//                           cardBlurRadius: 0,
//                           cardShadowColorOpacity: 0,
//                           cardSpreadRadius: 0,
//                         ),
//                       ),
//                     )
//                   ],
//                 )));
//   }
// }

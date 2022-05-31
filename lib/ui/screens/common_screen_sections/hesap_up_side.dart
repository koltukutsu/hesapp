// necessary
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hesap/ui/screens/restoranlar/components/restoranlar_sliver_persistent_header.dart';
import 'package:hesap/ui/widgets/HesapSearch.dart';

// components
import 'package:hesap/ui/widgets/hesap_text_card.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

class SliverUpSide extends StatefulWidget {
  const SliverUpSide({
    Key? key,
  }) : super(key: key);

  @override
  State<SliverUpSide> createState() => _SliverUpSideState();
}

class _SliverUpSideState extends State<SliverUpSide> {

  @override
  Widget build(BuildContext context) {
    return const SliverPersistentHeader(
      delegate: HesapUpSide(
        mekanIsmi: "Cafe Flutter fgişhljdasklaj",
        secondText: "Masa 24",),
      pinned: true,
    );
  }
}

class HesapUpSide extends SliverPersistentHeaderDelegate {
  static const double maxYukseklik = 290;

  const HesapUpSide({
    required this.mekanIsmi,
    required this.secondText,
  }) : super();

  final String mekanIsmi;
  final String secondText;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
    shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) - 20;
    double topPadding = MediaQuery.of(context).padding.top + 250;

    // var secondText = "Menu";
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        const SizedBox(
          height: maxYukseklik,
        ),
        MaviKisim(topPadding: topPadding),
        SvgPicture.asset('assets/images/background.svg'),
        MekanYazisi(mekanIsmi: mekanIsmi),
        MasaYazisi(maxYukseklik: maxYukseklik, offset: offset, secondText: secondText),
        // HesapSearch()
      ],
    );
  }

  @override
  double get maxExtent => maxYukseklik;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;

}

class MekanYazisi extends StatelessWidget {
  const MekanYazisi({
    Key? key,
    required this.mekanIsmi,
  }) : super(key: key);

  final String mekanIsmi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: SizedBox(
          width: 250,
          height: 100,
          child: HesapNormalText(
              text: mekanIsmi,
              fontSize: Insets.xll,
              textColor: AppColors.white),
        ),
      ),
    );
  }
}

class MasaYazisi extends StatelessWidget {
  const MasaYazisi({
    Key? key,
    required this.maxYukseklik,
    required this.offset,
    required this.secondText,
  }) : super(key: key);

  final double maxYukseklik;
  final double offset;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxYukseklik -130 + offset,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 130,
          child: HesapTextCard(
            text: secondText,
            fontSize: Insets.xll,
            textColor: Colors.black87,
            cardColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}

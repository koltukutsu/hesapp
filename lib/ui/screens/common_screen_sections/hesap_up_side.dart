// necessary
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        mekanIsmi: "Cafe Flutter",
        secondText: "Masa 24",
      ),
      pinned: true,
    );
  }
}

class HesapUpSide extends SliverPersistentHeaderDelegate {
  static const double maxYukseklik = 240;

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
        MaviKisim2(topPadding: topPadding),
        SvgPicture.asset('assets/images/background.svg'),
        MekanYazisi(
            topPadding: topPadding, offset: offset, mekanIsmi: mekanIsmi),
        MasaYazisi(
            topPadding: topPadding, offset: offset, secondText: secondText),
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
  MekanYazisi({
    Key? key,
    required this.mekanIsmi,
    required this.offset,
    required this.topPadding,
  }) : super(key: key);

  final String mekanIsmi;
  final double offset;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: topPadding - 210 + (offset * 0.66),
      child: HesapNormalText(
          text: mekanIsmi, fontSize: Insets.xll, textColor: AppColors.white),
    );
  }
}

class MasaYazisi extends StatelessWidget {
  const MasaYazisi({
    Key? key,
    required this.topPadding,
    required this.offset,
    required this.secondText,
  }) : super(key: key);

  final double topPadding;
  final double offset;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: topPadding + 20,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 100,
          child: HesapTextCard(
            text: secondText,
            fontSize: Insets.xl,
            textColor: Colors.black87,
            cardColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class MaviKisim2 extends StatelessWidget {
  const MaviKisim2({
    Key? key,
    required this.topPadding,
  }) : super(key: key);

  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.05,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: topPadding - 95,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

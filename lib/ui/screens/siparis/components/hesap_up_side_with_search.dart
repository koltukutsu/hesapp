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

import '../../common_screen_sections/hesap_up_side.dart';
import '../../restoranlar/components/restoranlar_sliver_persistent_header.dart';

class SliverUpSideWithSearch extends StatefulWidget {
  const SliverUpSideWithSearch({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  State<SliverUpSideWithSearch> createState() => _SliverUpSideWithSearchState();
}

class _SliverUpSideWithSearchState extends State<SliverUpSideWithSearch> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: HesapUpSideWithSearch(
          mekanIsmi: widget.data["Kafe Ismi"], secondText: "Menü"),
      pinned: true,
    );
  }
}

class HesapUpSideWithSearch extends SliverPersistentHeaderDelegate {
  static const double maxYukseklik = 240;

  const HesapUpSideWithSearch({
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
        MenuYazisi(offset: offset),
        AramaKismi(
            topPadding: topPadding, maxYukseklik: maxYukseklik, offset: offset)
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

class MenuYazisi extends StatelessWidget {
  MenuYazisi({
    Key? key,
    required this.offset,
  }) : super(key: key);

  final double offset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270 + offset,
      child: const HesapNormalText(
        text: 'Menü',
        textColor: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 35,
      ),
    );
  }
}

class AramaKismi extends StatelessWidget {
  const AramaKismi({
    Key? key,
    required this.maxYukseklik,
    required this.offset,
    required this.topPadding,
  }) : super(key: key);

  final double maxYukseklik;
  final double offset;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: topPadding - 30,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 60,
          child: HesapSearch(),
        ),
      ),
    );
  }
}

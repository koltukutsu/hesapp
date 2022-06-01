import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hesap/ui/screens/common_screen_sections/hesap_up_side.dart';

import '../../../theme/colors.dart';

class SliverHeader extends StatefulWidget {
  const SliverHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<SliverHeader> createState() => _SliverHeaderState();
}

class _SliverHeaderState extends State<SliverHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverAppBar(),
      pinned: true,
    );
  }
}

class SliverAppBar extends SliverPersistentHeaderDelegate {
  static const double maxYukseklik = 240;

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
        const SizedBox(height: maxYukseklik,),
        MaviKisim2(topPadding: topPadding),
        SvgPicture.asset('assets/images/background.svg'),
        MekanYazisi(mekanIsmi: "Cafe Flutter", offset: offset, topPadding: topPadding),
        SepetYazisi(topPadding: topPadding, offset: offset),
        const SepetinizdekiUrunler(),
      ],
    );
  }

  @override
  double get maxExtent => maxYukseklik;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}

class SepetYazisi extends StatelessWidget {
  const SepetYazisi({
    Key? key,
    required this.topPadding,
    required this.offset,
  }) : super(key: key);

  final double topPadding;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100 + offset/2,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.shopping_basket, color: AppColors.white),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Sepet',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 30,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SepetinizdekiUrunler extends StatelessWidget {
  const SepetinizdekiUrunler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 190,
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              'Sepetinizdeki Ürünler',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: ' Quicksand',
                  color: AppColors.darkBackground,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

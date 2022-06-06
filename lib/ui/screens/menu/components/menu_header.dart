import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hesap/cubit/masa/masa_cubit.dart';

import '../../../theme/colors.dart';

class SliverMenuHeader extends StatefulWidget {
  const SliverMenuHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<SliverMenuHeader> createState() => _SliverMenuHeaderState();
}

class _SliverMenuHeaderState extends State<SliverMenuHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverAppBar(
        maxYukseklik: 200.0,
      ),
      pinned: true,
    );
  }
}

class SliverAppBar extends SliverPersistentHeaderDelegate {
  final double maxYukseklik;

  SliverAppBar({required this.maxYukseklik});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
    shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) - 20;
    double topPadding = MediaQuery.of(context).padding.top + 220;

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        SizedBox(
          height: maxYukseklik,
        ),
        Transform.scale(
          scale: 1.05,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: topPadding - 55,
              color: AppColors.primary,
            ),
          ),
        ),
        SvgPicture.asset('assets/images/background.svg'),
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              context.read<MasaCubit>().restaurantName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 32,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.menu_book, color: AppColors.white),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Menü',
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

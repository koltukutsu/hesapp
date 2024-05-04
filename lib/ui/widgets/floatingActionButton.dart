// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/sepet/sepet_cubit.dart';
import 'package:hesap/util/constants.dart';
import 'package:badges/badges.dart' as badges;

import '../theme/colors.dart';

class HesapFloatingActionButton extends StatefulWidget {
  const HesapFloatingActionButton({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  State<HesapFloatingActionButton> createState() =>
      _HesapFloatingActionButton();
}

class _HesapFloatingActionButton extends State<HesapFloatingActionButton> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return buildFloatingActionButton(index: widget.index);
  }

  Widget buildFloatingActionButton({required int index}) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      onPressed: () {
        Navigator.of(context).pushNamed(ROUTE_SEPET_EKRAN);
        // setState(() {
        //   count++;
        // });
      },
      child: BlocBuilder<SepetCubit, SepetState>(
        // buildWhen: (previous, current) {
        //   return current is SepetDecrement || current is SepetIncrement;
        // },
        builder: (context, state) => badges.Badge(
          showBadge: context.watch<SepetCubit>().orderSums >= 0,
          badgeContent: Text(context.watch<SepetCubit>().orderSums.toString(),
              style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          badgeStyle: const badges.BadgeStyle(
            // shape: badges.BadgeShape.circle,
            badgeColor: Colors.white,
            // padding: EdgeInsets.all(5),
            // borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColors.white, width: 3),
            // borderGradient:
            //     badges.BadgeGradient.linear(colors: [Colors.red, Colors.black]),
            // badgeGradient: badges.BadgeGradient.linear(
            //   colors: [Colors.blue, Colors.yellow],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            elevation: 0,
          ),
          child:
              const Icon(Icons.shopping_cart_outlined, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}

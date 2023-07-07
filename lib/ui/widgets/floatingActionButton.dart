// necessary
import 'package:flutter/material.dart';
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
      onPressed: () {
        // Navigator.of(context).pushNamed(ROUTE_SEPET_EKRAN);
        setState(() {
          count++;
        });
      },
      child: badges.Badge(
        showBadge: count > 0,
        badgeContent: Text(count.toString(), style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 16)),
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
            Icon(Icons.shopping_cart_outlined, size: 30, color: Colors.white),
      ),
    );
  }
}

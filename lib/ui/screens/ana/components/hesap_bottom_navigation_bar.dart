// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/util/constants.dart';

class HesapBottomNavigationBar extends StatefulWidget {
  const HesapBottomNavigationBar({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  State<HesapBottomNavigationBar> createState() => _HesapBottomNavigationBar();
}

class _HesapBottomNavigationBar extends State<HesapBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    const placeHolder = Opacity(
      opacity: 0,
      child: IconButton(
        icon: Icon(Icons.no_cell),
        onPressed: null,
      ),
    );
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(index: 0, icon: const Icon(Icons.home)),
            buildTabItem(index: 1, icon: const Icon(Icons.fastfood)),
            // buildTabItem(index: 2, icon: const Icon(Icons.shopping_basket_outlined)),
            placeHolder,
            buildTabItem(index: 2, icon: const Icon(Icons.room_service)),
            buildTabItem(index: 3, icon: const Icon(Icons.person)),
          ],
        ));
  }

  Widget buildTabItem({required int index, required Icon icon}) {
    final isSelected = index == widget.index;
    return IconTheme(
      data: IconThemeData(
        color: isSelected ? AppColors.chosen : AppColors.gray,
      ),
      child: IconButton(
          icon: icon,
          iconSize: 32,
          onPressed: () {
            if (index == 0) {
              // TODO: buradaki 1. sayda mantigi duzeltilmeli
              //context.read<QRCubit>().leaveTable();
              BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(0);
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //     ROUTE_RESTAURANTS, (Route<dynamic> route) => false);
            } else if (index == 1) {
              BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(1);
            }
            // else if (index == 2) {
            //   BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(2);
            // }
            else if (index == 2) {
              BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(3);
            } else if (index == 3) {
              BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(4);
            }
          }),
    );
  }
}

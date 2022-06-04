// necessary

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';

// components
import 'package:hesap/ui/screens/menu/components/menu_body.dart';

class MenuEkran extends StatefulWidget {
  const MenuEkran({Key? key}) : super(key: key);

  @override
  State<MenuEkran> createState() => _MenuEkranState();
}

class _MenuEkranState extends State<MenuEkran> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuBody(
        restaurantId: context.read<QRCubit>().restaurantId,
      ),
    );
  }
}

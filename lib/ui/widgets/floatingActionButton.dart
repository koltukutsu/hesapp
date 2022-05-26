// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/ui/screens/qr_code/qr_okuma_ekran.dart';
import 'package:hesap/ui/screens/qr_scanner/qr_scanner_screen.dart';
import 'package:hesap/util/constants.dart';

// pages
// import 'package:hesap/ui/screens/qr_scanner/qr_scanner_screen.dart';

class HesapFloatingActionButton extends StatefulWidget {
  const HesapFloatingActionButton(
      {Key? key, required this.index, required this.onChangedButton})
      : super(key: key);
  final int index;
  final ValueChanged<int> onChangedButton;

  // void _floatingActionButtonFuction() {}
  // required this.floatingActionButtonFuction, this.icon = Icons.qr_code_scanner
  @override
  State<HesapFloatingActionButton> createState() =>
      _HesapFloatingActionButton();
}

class _HesapFloatingActionButton extends State<HesapFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return buildFloatingActionButton(index: widget.index);
  }

  Widget buildFloatingActionButton({required int index}) {
    if (index == 0) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ROUTE_QR_SCREEN);
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => const QRScannerScreen()));
        },
        child: const Icon(Icons.qr_code_scanner),
      );
    } else {
      return BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
        builder: (context, state) {
          return FloatingActionButton(
            // onPressed: () => widget.onChangedButton(index),
            onPressed: () => BlocProvider.of<DegisenEkranlarCubit>(context).onChangedButton(index),
            child: const Icon(Icons.exit_to_app),
          );
        }
      );
    }
  }
}

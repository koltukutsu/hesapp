import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/logic/masa/masa_cubit.dart';
import 'package:hesap/logic/qr/qr_cubit.dart';
import 'package:hesap/presentation/screens/pop_up/pop_ekran.dart';
import 'package:hesap/presentation/screens/qr_scanner/components/qr_scanner_body.dart';
import 'package:hesap/util/constants.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MasaCubit, MasaState>(
      listener: (context, state) {
        if (state is MasaInState) {
          Navigator.pop(context);
          Navigator.pushNamed(context, ROUTE_POP_EKRAN);
        }
      },
      builder: (context, state) {
        return const QRScannerBody();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';
import 'package:hesap/ui/screens/pop_up/pop_ekran.dart';
import 'package:hesap/ui/screens/qr_scanner/components/qr_scanner_body.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  @override
  void initState() {
    super.initState();
    //context.read<QRCubit>().scanTest();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QRCubit, QRState>(
      listener: (context, state) {
        if (state is QRSuccessful) {
          context.read<QRCubit>().dispose();
        }
      },
      builder: (context, state) {
        if (state is QRSuccessful) {
          return PopUpEkran(qrData: state.qrData);
        }
        return const QRScannerBody();
      },
    );
  }
}

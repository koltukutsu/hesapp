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
    context.read<QRCubit>().scanTest();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QRCubit, QRState>(
      builder: (context, state) {
        if (state is QRSuccessful) {
          return PopUpEkran(qrStream: state.qrStream);
        }
        return const QRScannerBody();
      },
    );
  }

  @override
  void dispose() {
    context.read<QRCubit>().dispose();
    super.dispose();
  }
}

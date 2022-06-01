import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';
import 'package:hesap/ui/screens/qr_scanner/components/qr_scanner_body.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QRCubit, QRState>(
      builder: (context, state) {
        if (state is QRWaiting) {
          return const QRScannerBody();
        } else if (state is QRSuccessful) {
          return Container(); // TODO: Masa özet sayfası açılacak
        }
        return Container();
      },
    );
  }

  @override
  void dispose() {
    context.read<QRCubit>().dispose();
    super.dispose();
  }
}

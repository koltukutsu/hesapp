import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/masa/masa_cubit.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';
import 'package:hesap/ui/screens/qr_scanner/components/qr_scanner_view.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/util/constants.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerBody extends StatefulWidget {
  const QRScannerBody({Key? key}) : super(key: key);

  @override
  State<QRScannerBody> createState() => _QRScannerBodyState();
}

class _QRScannerBodyState extends State<QRScannerBody> {
  QRViewController? controller;

  @override
  void initState() {
    // TODO: QR okutma ekranını hızlıca geçmek için. Silinecek.
    super.initState();
    context.read<MasaCubit>().scanTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            QRScanner(
              onQRViewCreated: (controller) {
                this.controller = controller;
                controller.scannedDataStream.listen(
                  (scanData) {
                    setState(
                      () {
                        //context.read<MasaCubit>().scan(scanData);
                      },
                    );
                  },
                );
              },
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                    color: AppColors.primary,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.scale(
                        scale: 4,
                        child: IconButton(
                          // TODO: burasi sonradan kaldirilacak
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {
                            Navigator.of(context).pushNamed(ROUTE_POP_EKRAN);
                          },
                        ),
                      ),
                      const Text(
                        "Masadaki QR kodu okutun",
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(
                          "assets/images/qr.png",
                          width: 96,
                          height: 96.0,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

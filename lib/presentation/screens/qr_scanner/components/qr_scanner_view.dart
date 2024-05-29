import 'package:flutter/material.dart';
import 'package:hesap/presentation/theme/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatelessWidget {
  QRScanner({Key? key, required this.onQRViewCreated}) : super(key: key);

  final GlobalKey qrKey = GlobalKey();
  final Function(QRViewController) onQRViewCreated;

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 350.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: AppColors.primary,
        borderRadius: 16,
        borderWidth: 12,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (_, permission) => _onPermissionSet(context, permission),
    );
  }

  void _onPermissionSet(BuildContext context, bool permission) {
    if (!permission) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen uygulamaya kamera izni verin.')),
      );
    }
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// part 'qr_state.dart';
//
// class QRCubit extends Cubit<QRState> {
//   QRViewController? controller;
//
//   QRCubit() : super(QRInitial()) {
//     emit(const QRWaiting());
//   }
//
//   scan(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       emit(QRSuccessful(scanData));
//     });
//   }
//
//   dispose() {
//     /// Stream'i durdurur.
//     controller?.dispose();
//   }
//
//   /// QR kodundan gelen veriyi işlemek için
// /*
//   Map<String, String> decode(Barcode qrResult) {
//     List<String> qrResults = qrResult.code!.split('/');
//
//     final Map<String, String> qrDecodedResult = {
//       "restaurant": qrResults[0],
//       "table": qrResults[1],
//     };
//
//     return qrDecodedResult;
//   }
// */
// }

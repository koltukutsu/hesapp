import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/data/repository/auth_repository.dart';
import 'package:hesap/data/repository/qr_repository.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_state.dart';

class QRCubit extends Cubit<QRState> {
  final QRRepository _qrRepository;
  final AuthRepository _authRepository;

  QRViewController? controller;
  Barcode? qr;
  String restaurantId = "TyZa1uLFz27YKTH7Yhy2"; //TODO: Boş olacak.
  String tableId = "";

  QRCubit(this._qrRepository, this._authRepository) : super(QRInitial());

  scan(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        qr = scanData;
        List<String> decodedData = decode(qr!);
        // _sitAtTable(decodedData);
        var qrStream = _qrRepository.getPeopleAtTable(decodedData);
        emit(QRSuccessful(qrStream));
      },
    );
  }

  scanTest() {
    List<String> decodedData = ["TyZa1uLFz27YKTH7Yhy2", "JcDxVOOOxQy0ZQQxPIOm"];
    // _sitAtTableTest();
    var qrStream = _qrRepository.getPeopleAtTable(decodedData);
    emit(QRSuccessful(qrStream));
  }

  _sitAtTable(List<String> decodedData) async {
    HesapUser? hesapUser = await _authRepository.getHesapUser();
    _qrRepository.sitAtTable(decodedData, hesapUser!);
  }

  // TODO: Herhangi bir QR kod ile hızlıca pop-up ekranına geçmek için. Daha sonra silinecek
  sitAtTableTest() async {
    HesapUser? hesapUser = await _authRepository.getHesapUser();
    _qrRepository.sitAtTable(
        ["TyZa1uLFz27YKTH7Yhy2", "JcDxVOOOxQy0ZQQxPIOm"], hesapUser!);
  }

  leaveTable() async {
    HesapUser? hesapUser = await _authRepository.getHesapUser();
    _qrRepository.leaveTable(decode(qr!), hesapUser!);
    emit(QRInitial());
  }

  List<String> decode(Barcode qrResult) {
    var qrDecoded = qrResult.code!.split('/');
    restaurantId = qrDecoded[0];
    tableId = qrDecoded[1];
    return qrDecoded;
  }

  dispose() {
    controller?.dispose();
  }
}

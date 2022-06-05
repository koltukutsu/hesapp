import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/repository/auth_repository.dart';
import 'package:hesap/data/repository/table_repository.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_state.dart';

class QRCubit extends Cubit<QRState> {
  final TableRepository _tableRepository;
  final AuthRepository _authRepository;

  List<String> decodedQRData = ["TyZa1uLFz27YKTH7Yhy2", "JcDxVOOOxQy0ZQQxPIOm"];

  QRCubit(this._tableRepository, this._authRepository) : super(QRInitial());

  scan() {
    emit(const QRSuccessful());

    /*
    controller.scannedDataStream.listen(
      (scanData) {
        qr = scanData;
        List<String> decodedQRData = decodeQR(qr!);
        emit(QRSuccessful(decodedQRData));
      },
    );
     */
  }

  List<String> decodeQR(Barcode qrResult) {
    return qrResult.code!.split('/');
  }

/*
  scan(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        qr = scanData;
        List<String> decodedData = decode(qr!);
        // _sitAtTable(decodedData);
        var qrStream = _qrRepository.getPeopleAtTable(decodedData);
        emit(QRSuccessful(qrStream, decodedData));
      },
    );
  }

  getPeopleOnTable() {
    List<String> decodedData = decode(qr!);
    var qrStream = _qrRepository.getPeopleAtTable(decodedData);
    emit(QRSuccessful(qrStream, decodedData));
  }

  scanTest() {
    List<String> decodedData = ["TyZa1uLFz27YKTH7Yhy2", "JcDxVOOOxQy0ZQQxPIOm"];
    // _sitAtTableTest();
    var qrStream = _qrRepository.getPeopleAtTable(decodedData);
    emit(QRSuccessful(qrStream, decodedData));
  }

  getTableInfo() {}

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
    return qrResult.code!.split('/');
  }

  dispose() {
    controller?.dispose();
  }*/
}

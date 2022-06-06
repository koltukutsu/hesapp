import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/data/repository/auth_repository.dart';
import 'package:hesap/data/repository/table_repository.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'masa_state.dart';

class MasaCubit extends Cubit<MasaState> {
  final TableRepository _tableRepository;
  final AuthRepository _authRepository;

  MasaCubit(this._tableRepository, this._authRepository) : super(MasaInitial());

  String restaurantId = "";
  String tableId = "";

  String restaurantName = "";
  String tableName = "";

  scan(Barcode qrData) {
    var decodedData = qrData.code!.split('/');
    restaurantId = decodedData[0];
    tableId = decodedData[1];
    emit(MasaInState(decodedData));
  }

  getPeopleOnTable() {
    return _tableRepository.getPeopleAtTable([restaurantId, tableId]);
  }

  sitAtTable(HesapUser hesapUser) async {
    _tableRepository.sitAtTable(
      [restaurantId, tableId],
      hesapUser,
    );
  }

  leaveTable(HesapUser hesapUser) async {
    _tableRepository.leaveTable([restaurantId, tableId], hesapUser);
    emit(MasaInitial());
  }
}

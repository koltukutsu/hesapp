import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/repository/table_repository.dart';

part 'masa_state.dart';

class MasaCubit extends Cubit<MasaState> {
  final TableRepository _tableRepository;
  MasaCubit(this._tableRepository) : super(MasaInitial());

  String restaurantId = "";
  String tableId = "";

  setIds(List<String> qrData) {
    restaurantId = qrData[0];
    tableId = qrData[1];
  }

  getPeopleOnTable() {
    var tableStream =
        _tableRepository.getPeopleAtTable([restaurantId, tableId]);
    return tableStream;
  }

/*
  getTableInfo() async {
    var masaData = await _tableRepository.getTableInfo(restaurantId, tableId);
    emit(MasaBilgiYuklendi(masaData));
  }
  */
}

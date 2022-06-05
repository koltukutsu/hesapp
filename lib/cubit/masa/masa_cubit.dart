import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

  scan(Barcode qrData) {
    var decodedData = qrData.code!.split('/');
    restaurantId = decodedData[0];
    tableId = decodedData[1];
    emit(const MasaInState());
  }

  getPeopleOnTable() {
    var tableStream =
        _tableRepository.getPeopleAtTable([restaurantId, tableId]);
    return tableStream;
  }

  sitAtTableTest() async {
    HesapUser? hesapUser = await _authRepository.getHesapUser();
    _tableRepository.sitAtTable(
      ["TyZa1uLFz27YKTH7Yhy2", "JcDxVOOOxQy0ZQQxPIOm"],
      hesapUser!,
    );
  }
}


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import 'package:hesap/data/model/restoran.dart';
import 'package:hesap/data/repository/konum/konum_repository.dart';
import 'package:hesap/data/repository/restoran/restoran_repository.dart';

part 'restoran_state.dart';

class RestoranCubit extends Cubit<RestoranState> {
  final RestoranRepository _restoranRepository;
  RestoranCubit(this._restoranRepository) : super(RestoranInitial());

  Future<void> initialize() async {

      var restoranList = await _restoranRepository.loadLocalJson();
      var konum = await KonumRepository().getCurrentPosition();

      emit(RestoranYuklendi(restoranList, konum));
  }


}

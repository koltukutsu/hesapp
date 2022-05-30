
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hesap/data/model/restoran.dart';
import 'package:hesap/data/repository/restoran/restoran_repository.dart';

part 'restoran_state.dart';

class RestoranCubit extends Cubit<RestoranState> {
  final RestoranRepository _restoranRepository;
  RestoranCubit(this._restoranRepository) : super(RestoranInitial());

  Future<void> initialize() async {

    try {
      emit(RestoranYukleniyor());

      var restoranList = await _restoranRepository.loadLocalJson();

      if (restoranList != null) {
        emit(RestoranYuklendi(restoranList));
      }
    } catch (error) {
      emit(const RestoranYuklenemedi("Restoranlar yüklenemedi."));
    }

    var restoranList = await _restoranRepository.loadLocalJson();

      emit(RestoranYuklendi(restoranList));
  }


}

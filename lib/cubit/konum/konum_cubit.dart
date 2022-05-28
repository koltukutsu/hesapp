import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hesap/data/repository/konum/konum_repository.dart';

part 'konum_state.dart';

class KonumCubit extends Cubit<KonumState> {
  final KonumRepository _konumRepository;

  KonumCubit(this._konumRepository) : super(KonumInitial()) {
    checkPermission();
  }

  checkPermission() async {
    await _konumRepository.checkPermission();
  }

  Future getLocation() async {
    var konum = await _konumRepository.getCurrentPosition();
    var adres = await placemarkFromCoordinates(konum!.latitude, konum.longitude, localeIdentifier: 'tr_TR');

    if (konum != null) {
      emit(KonumYuklendi(konum, adres));
    } else {
      emit(const KonumYuklenemedi());
    }
  }
}

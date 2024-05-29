import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hesap/data/repository/konum/konum_repository.dart';

class KonumProvider extends ChangeNotifier {
  final KonumRepository _konumRepository;
  Position? konum;
  List<Placemark>? adres;

  KonumProvider(this._konumRepository) {
    checkPermission();
  }

  checkPermission() async {
    await _konumRepository.checkPermission();
  }

  Future getLocation() async {
    try {
      var konum = await _konumRepository.getCurrentPosition();
      var adres = await placemarkFromCoordinates(konum!.latitude, konum.longitude, localeIdentifier: 'tr_TR');

      if (konum != null) {
        this.konum = konum;
        this.adres = adres;
        notifyListeners();
      }
    } catch (error) {
      print("Error: $error");
    }

    var konum = await _konumRepository.getCurrentPosition();
    var adres = await placemarkFromCoordinates(konum!.latitude, konum.longitude, localeIdentifier: 'tr_TR');

    this.konum = konum;
    this.adres = adres;
    notifyListeners();
  }
}
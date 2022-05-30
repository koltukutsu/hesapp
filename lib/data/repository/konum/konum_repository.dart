import 'package:geolocator/geolocator.dart';
import 'package:hesap/util/hesap_exception.dart';

class KonumRepository {
  /// Son pozisyonu alır
/*  Future<Position?> getLastKnownPosition() async {
    return await Geolocator.getLastKnownPosition();
  }*/

  Future<LocationPermission> checkPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Konum alınamadı");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Uygulama ayarlarından konum iznini etkinleştirin.');
    }
    return permission;
  }

  Future<Position?> getCurrentPosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error("Konum hizmetleri devre dışı.");
      }
      checkPermission();
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (error) {
      throw HesapException("Konum alınamadı.");
    }
  }
}

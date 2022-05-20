import 'package:geolocator/geolocator.dart';


class KonumRepository {

  Future<Position> konum = Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  Future<Position?> lastPosition = Geolocator.getLastKnownPosition();



}
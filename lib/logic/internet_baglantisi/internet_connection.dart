import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetProvider extends ChangeNotifier {
  bool _isOnline = false;

  InternetProvider() {
    initialInternetControl();
  }

  bool get isOnline => _isOnline;

  initialInternetControl() async {
    print("internet kontrolu baslaniyor");
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("internet var");
      _isOnline = true;
      notifyListeners();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("internet var");
      _isOnline = true;
      notifyListeners();
    } else {
      print("internet yok");
      _isOnline = false;
      notifyListeners();
    }
  }
}
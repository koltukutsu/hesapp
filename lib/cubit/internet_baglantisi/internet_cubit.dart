import "package:bloc/bloc.dart";
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

part "internet_state.dart";

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetConnectionLoading()) {
    initialInternetControl();
  }

  initialInternetControl() async {
    // final StreamSubscription connection;
    print("internet kontrolu baslaniyor");
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      print("internet var");
;      emit(const InternetConnected());
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("internet var");
      // I am connected to a wifi network.
      emit(const InternetConnected());
    } else {
      print("internet yok");
      emit(const InternetNotConnected());
    }
  }

  bool get getInternetCondition {
    if (state is InternetConnected) {
      return true;
    } else {
      return false;
    }
  }
}

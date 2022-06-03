import "package:bloc/bloc.dart";
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

part "internet_state.dart";

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(const InternetConnectionLoading()) {
    _initialize();
  }

  _initialize() async {
    StreamSubscription? connection;
    connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        emit(const InternetNotConnected());
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        emit(const InternetConnected());
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        emit(const InternetConnected());
      } else if (result == ConnectivityResult.ethernet) {
        //connection is from wired connection
        emit(const InternetConnected());
      }
    });
  }
}

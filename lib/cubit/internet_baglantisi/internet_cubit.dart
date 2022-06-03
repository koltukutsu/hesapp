import "package:bloc/bloc.dart";
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

part "internet_state.dart";

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetConnectionLoading());

  initialize() {
    // final StreamSubscription connection;
    var connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print(123);
      if (result == ConnectivityResult.none) {
        emit(const InternetNotConnected());
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        emit(const InternetConnected(isOnline: true));
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        emit(const InternetConnected(isOnline: true));
      } else if (result == ConnectivityResult.ethernet) {
        //connection is from wired connection
        emit(const InternetConnected(isOnline: true));
      }
    });
  }
}

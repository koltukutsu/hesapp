part of 'qr_cubit.dart';

abstract class QRState extends Equatable {
  const QRState();
}

class QRInitial extends QRState {
  @override
  List<Object> get props => [];
}

class QRSuccessful extends QRState {
  const QRSuccessful();

  @override
  List<Object?> get props => [];
}

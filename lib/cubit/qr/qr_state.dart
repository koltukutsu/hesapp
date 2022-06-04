part of 'qr_cubit.dart';

abstract class QRState extends Equatable {
  const QRState();
}

class QRInitial extends QRState {
  @override
  List<Object> get props => [];
}

class QRSuccessful extends QRState {
  const QRSuccessful(this.qrStream);

  final Stream<QuerySnapshot<Map<String, dynamic>>> qrStream;

  @override
  List<Object?> get props => [qrStream];
}

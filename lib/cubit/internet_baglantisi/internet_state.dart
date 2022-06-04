part of "internet_cubit.dart";

abstract class InternetState extends Equatable {
  // final bool isOnline;

  const InternetState();
}

class InternetConnectionLoading extends InternetState {
  // final bool isOnline;
  // const InternetConnectionLoading({this.isOnline = false});

  @override
  List<Object?> get props => [];
}

class InternetConnected extends InternetState {
  final bool isOnline;

  const InternetConnected({this.isOnline = true});

  @override
  List<Object?> get props => [isOnline];
}

class InternetNotConnected extends InternetState {
  final bool isOnline;

  const InternetNotConnected({this.isOnline = false});

  @override
  List<Object?> get props => [isOnline];
}

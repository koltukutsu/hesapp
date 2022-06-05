part of 'masa_cubit.dart';

abstract class MasaState extends Equatable {
  const MasaState();
}

class MasaInitial extends MasaState {
  @override
  List<Object> get props => [];
}

class MasaInState extends MasaState {
  const MasaInState(this.tableInfo);

  final List<String> tableInfo;

  @override
  List<Object> get props => [tableInfo];
}

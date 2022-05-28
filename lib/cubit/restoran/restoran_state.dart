part of 'restoran_cubit.dart';

abstract class RestoranState extends Equatable {
  const RestoranState();
}

class RestoranInitial extends RestoranState {
  @override
  List<Object> get props => [];
}

class RestoranYukleniyor extends RestoranState {
  const RestoranYukleniyor();

  @override
  List<Object?> get props => [];
}

class RestoranYuklenemedi extends RestoranState {
  const RestoranYuklenemedi(String s);

  @override
  List<Object?> get props => [];
}

class RestoranYuklendi extends RestoranState {
  const RestoranYuklendi(this.restoranList);
  final List<Restoran> restoranList;

  @override
  List<Object?> get props => restoranList;
}

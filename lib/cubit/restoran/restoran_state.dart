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
  const RestoranYuklenemedi();

  @override
  List<Object?> get props => [];
}

class RestoranYuklendi extends RestoranState {
  const RestoranYuklendi(this.restoranList, this.konum);
  final List<Restoran> restoranList;
  final Position? konum;

  @override
  List<Object?> get props => restoranList;
}

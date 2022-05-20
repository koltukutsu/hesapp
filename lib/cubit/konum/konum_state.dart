part of 'konum_cubit.dart';

abstract class KonumState extends Equatable {
  const KonumState();
}

class KonumInitial extends KonumState {
  @override
  List<Object> get props => [];
}

class KonumYukleniyor extends KonumState {
  const KonumYukleniyor();

  @override
  List<Object?> get props => [];
}

class KonumYuklenemedi extends KonumState {
  const KonumYuklenemedi();

  @override
  List<Object?> get props => [];
}

class KonumYuklendi extends KonumState {
  final Position konum;

  const KonumYuklendi(this.konum);

  @override
  List<Object?> get props => [konum];
}

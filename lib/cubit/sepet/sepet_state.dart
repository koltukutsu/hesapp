part of 'sepet_cubit.dart';

abstract class SepetState extends Equatable {
  const SepetState();
}

class SepetInitial extends SepetState {
  @override
  List<Object> get props => [];
}

class SepetSuccess extends SepetState {
  const SepetSuccess(this.orderList);

  final Map<Product, int> orderList;

  @override
  List<Object?> get props => [];
}

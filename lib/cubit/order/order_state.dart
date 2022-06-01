part of 'order_cubit.dart';

abstract class OrderState extends Equatable {
  const OrderState();
}

class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}

class OrdersLoaded extends OrderState {
  const OrdersLoaded(this.orderList);

  final List<Order> orderList;

  @override
  List<Object> get props => [orderList];
}

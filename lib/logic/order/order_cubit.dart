import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/order_history.dart';
import 'package:hesap/data/repository/order_history_repository.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderHistoryRepository _orderHistoryRepository;
  OrderCubit(this._orderHistoryRepository) : super(OrderInitial());

  fetchOrderHistory() async {
    List<OrderHistory> orderList =
        await _orderHistoryRepository.fetchOrderHistory();
    emit(OrdersLoaded(orderList));
  }
}

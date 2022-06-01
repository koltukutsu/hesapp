import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/data/repository/profile_repository.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final ProfileRepository _preferencesRepository;
  OrderCubit(this._preferencesRepository) : super(OrderInitial());

  fetchOrderHistory() async {
    List<Order> orderList = await _preferencesRepository.fetchOrderHistory();
    emit(OrdersLoaded(orderList));
  }
}

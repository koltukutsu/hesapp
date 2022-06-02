import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/order_item.dart';
import 'package:hesap/data/repository/Order/OrderServices.dart';

part 'sepet_state.dart';

class SepetCubit extends Cubit<SepetState> {
  //final OrderServices _orderServices;

  SepetCubit() : super(SepetInitial());

  List<OrderItem> orderList = [];

  loadOrders() {
    orderList = OrderServices.getOrderList();

    emit(SepetSuccess(orderList));
  }
}

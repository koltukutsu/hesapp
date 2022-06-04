import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/data/model/product.dart';
import 'package:hesap/data/repository/Order/OrderServices.dart';

part 'sepet_state.dart';

class SepetCubit extends Cubit<SepetState> {
  SepetCubit() : super(SepetInitial());

  Map<Product, int> orderList = {};

  loadOrders() {
    emit(SepetSuccess(orderList));
  }

  double calculateOrderSum() {
    double sum = 0.0;
    return orderList.keys.fold<double>(
      0.0,
      (previousValue, order) {
        sum = sum + order.price;
        return sum;
      },
    );
  }

  addToCart(Product product) {
    if (!orderList.containsKey(product)) {
      orderList[product] = 1;
    } else {
      orderList[product] = orderList[product]! + 1;
    }
  }
}

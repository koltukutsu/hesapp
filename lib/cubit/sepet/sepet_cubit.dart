import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/data/model/product.dart';
import 'package:hesap/data/repository/Order/OrderServices.dart';

part 'sepet_state.dart';

class SepetCubit extends Cubit<SepetState> {
  SepetCubit() : super(SepetInitial());

  // double sum = 0.0;

  Map<Product, int> orderList = {};

  loadOrders() {
    emit(SepetSuccess(orderList));
  }

  double calculateOrderSum() {
    double sum = 0.0;

    return orderList.keys.fold<double>(
      0.0,
      (previousValue, order) {
        sum = sum + order.price * orderList[order]!;
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

  void deleteItemAndReturnZero(Product product) {
    orderList.removeWhere((key, _) => key == product);
    emit(SepetSuccess(orderList));
  }

  increment(Product product) {
    orderList[product] = orderList[product]! + 1;
    // sum = sum - product.price;
  }

  decrement(Product product) {
    if (orderList[product]! > 1) {
      orderList[product] = orderList[product]! - 1;
      // sum = sum - product.price;
      emit(SepetSuccess(
          orderList)); // TODO: emit duzgun calismiyor, ekranda gozukmuyor
    } else {
      deleteItemAndReturnZero(product);
    }
  }
}

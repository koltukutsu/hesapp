import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hesap/ui/screens/sepet/components/order_footer.dart';
import 'package:hesap/ui/screens/sepet/components/order_header.dart';
import 'package:hesap/ui/screens/sepet/components/sepet_app_bar.dart';

import '../../../data/model/OrdersModel.dart';
import '../../../data/repository/Order/OrderServices.dart';
import 'components/orders_list.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<OrderScreen> {
  OrderServices get service => GetIt.I<OrderServices>();

  List<OrdersModel> items = [];
  @override
  void initState() {
    items = OrderServices.getOrderList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SepetAppBar(),
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          const SliverHeader(),
          OrdersList(items),
        ],
      ),
      bottomNavigationBar:  SepetFooter(_calculateTotal()),
    );
  }

  String _calculateTotal(){
    double total = 0;
    for(var item in items){
      if(item.selected){
        total += item.quantity * item.price;
      }
    }
    return total.toString();
  }

}

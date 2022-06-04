import 'package:flutter/material.dart';
import 'package:hesap/ui/screens/sepet/components/order_footer.dart';
import 'package:hesap/ui/screens/sepet/components/order_header.dart';
import 'components/orders_list.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: SepetAppBar(),
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          const SliverHeader(),
          OrdersList(),
        ],
      ),
      bottomNavigationBar: SepetFooter(),
    );
  }
}

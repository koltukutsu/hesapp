import 'package:flutter/material.dart';
import 'package:hesap/data/model/order.dart';

import 'components/payment_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaymentBody(
        orderList: [],
      ),
    );
  }
}

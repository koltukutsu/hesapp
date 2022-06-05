import 'package:flutter/material.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/ui/theme/colors.dart';

import 'components/payment_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ödeme Ekranı"),
        backgroundColor: AppColors.primary,
      ),
      body: PaymentBody(
        orderList: [],
      ),
    );
  }
}

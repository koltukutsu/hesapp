import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/logic/card/card_cubit.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/presentation/theme/colors.dart';

import 'components/payment_body.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  initState(){
    // context.read<CardCubit>().fetchSavedCardFromSharedPreferences();
    // context.read<CardCubit>().fetchChosenCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ödeme Ekranı"),
        backgroundColor: AppColors.primary,
      ),
      body: const PaymentBody(
        orderList: [],
      ),
    );
  }
}

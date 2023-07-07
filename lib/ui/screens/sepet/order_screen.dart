import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/sepet/sepet_cubit.dart';
import 'package:hesap/ui/screens/sepet/components/order_footer.dart';
import 'package:hesap/ui/screens/sepet/components/order_header.dart';
import 'components/orders_list.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<SepetCubit>().updateSepet();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(""),
        ),
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            const SliverHeader(),
            OrdersList(),
          ],
        ),
        bottomNavigationBar: const SepetFooter(),
      ),
    );
  }
}

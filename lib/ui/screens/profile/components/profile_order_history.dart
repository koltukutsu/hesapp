import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/order/order_cubit.dart';
import 'package:hesap/ui/screens/profile/components/profile_expandable_button.dart';
import 'package:hesap/ui/screens/profile/components/profile_order_item.dart';
import 'package:hesap/ui/theme/insets.dart';

class ProfileOrderHistory extends StatefulWidget {
  const ProfileOrderHistory({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileOrderHistory> createState() => _ProfileOrderHistoryState();
}

class _ProfileOrderHistoryState extends State<ProfileOrderHistory> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(Insets.s),
          ),
        ),
        child: Column(
          children: [
            ProfileExpandableButton(
              title: 'Geçmiş Siparişlerim',
              expanded: expanded,
              toggle: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
            Visibility(
              visible: expanded,
              child: BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  if (state is OrdersLoaded) {
                    if (state.orderList.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Geçmiş siparişiniz bulunmuyor"),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.orderList.length,
                      itemBuilder: (context, index) {
                        return ProfileOrderItem(
                          order: state.orderList[index],
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

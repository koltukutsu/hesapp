import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/ui/screens/profile/components/profile_expandable_button.dart';
import 'package:hesap/ui/screens/profile/components/profile_order_item.dart';
import 'package:hesap/ui/theme/insets.dart';

class ProfileOrderHistory extends StatelessWidget {
  const ProfileOrderHistory({
    Key? key,
    required this.orderHistoryExpanded,
  }) : super(key: key);

  final bool orderHistoryExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            expanded: orderHistoryExpanded,
            toggle: () {
              context.read<ProfileCubit>().toggleOrderHistory();
            },
          ),
          FutureBuilder(
            future: context.read<ProfileCubit>().fetchOrderHistory(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<Order>> snapshot,
            ) {
              if (snapshot.hasData) {
                return Visibility(
                  visible: orderHistoryExpanded,
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ProfileOrderItem(
                          name: snapshot.data![index].place,
                          date: snapshot.data![index].date,
                          sum: snapshot.data![index].sum,
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/ui/screens/profile/components/profile_expandable_button.dart';
import 'package:hesap/ui/screens/profile/components/profile_order_item.dart';
import 'package:hesap/ui/theme/insets.dart';

class ProfileOrderHistory extends StatefulWidget {
  const ProfileOrderHistory({
    Key? key,
    required this.orderList,
  }) : super(key: key);

  final List<Order> orderList;

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
              child: ListView.builder(
                shrinkWrap: true,
                reverse: true,
                itemCount: widget.orderList.length,
                itemBuilder: (context, index) {
                  return ProfileOrderItem(
                    order: widget.orderList[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

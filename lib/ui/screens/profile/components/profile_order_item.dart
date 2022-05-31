import 'package:flutter/material.dart';
import 'package:hesap/data/model/order.dart';

class ProfileOrderItem extends StatelessWidget {
  const ProfileOrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.place,
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    order.date,
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '${order.sum} ₺',
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileOrderItem extends StatelessWidget {
  const ProfileOrderItem({
    Key? key,
    required this.name,
    required this.date,
    required this.sum,
  }) : super(key: key);

  final String name;
  final String date;
  final String sum;

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
                    name,
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    date,
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
            '$sum ₺',
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

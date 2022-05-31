import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hesap/data/model/card.dart' as card_model;

class ProfileSavedCardItem extends StatelessWidget {
  const ProfileSavedCardItem({Key? key, required this.card}) : super(key: key);

  final card_model.Card card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/card_${card.brand.name}.svg',
            width: 48,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  card.number,
                  style: const TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  card.toString(),
                  style: const TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

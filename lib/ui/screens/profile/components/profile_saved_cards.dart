import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hesap/data/model/card.dart' as card_model;
import 'package:hesap/ui/screens/profile/components/profile_expandable_button.dart';
import 'package:hesap/ui/screens/profile/components/profile_saved_card_item.dart';
import 'package:hesap/ui/theme/insets.dart';

class ProfileSavedCards extends StatefulWidget {
  const ProfileSavedCards({
    Key? key,
    required this.savedCards,
  }) : super(key: key);

  final List<card_model.Card> savedCards;

  @override
  State<ProfileSavedCards> createState() => _ProfileSavedCardsState();
}

class _ProfileSavedCardsState extends State<ProfileSavedCards> {
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
              title: 'Kayıtlı Kartlarım',
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
                itemCount: widget.savedCards.length,
                itemBuilder: (context, index) {
                  return ProfileSavedCardItem(
                    card: widget.savedCards[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

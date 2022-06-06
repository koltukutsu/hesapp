import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/card/card_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/model/saved_card.dart' as card_model;
import 'package:hesap/ui/screens/profile/components/profile_expandable_button.dart';
import 'package:hesap/ui/screens/profile/components/profile_saved_card_item.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

import 'payment_saved_card_item.dart';

class PaymentSavedCards extends StatefulWidget {
  const PaymentSavedCards({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentSavedCards> createState() => _PaymentSavedCardsState();
}

class _PaymentSavedCardsState extends State<PaymentSavedCards> {
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
              child: BlocBuilder<CardCubit, CardState>(
                builder: (context, state) {
                  if (state is CardLoaded) {
                    if (state.savedCards.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Transform.scale(
                              scale: 2.5,
                              child: const Icon(Icons.report_problem,
                                  color: AppColors.magenta),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Kayıtlı kartınız bulunmuyor."),
                                Text(" Kart Ekle kısmından ekleyebilirsiniz")
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.savedCards.length,
                      itemBuilder: (context, index) {
                        return PaymentSavedCardItem(
                          card: state.savedCards[index],
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

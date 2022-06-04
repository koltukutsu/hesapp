import 'package:flutter/material.dart';
import 'package:hesap/data/model/saved_card.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

class PaymentCardList extends StatefulWidget {
  const PaymentCardList({Key? key, required this.cardList}) : super(key: key);

  final List<SavedCard> cardList;

  @override
  State<PaymentCardList> createState() => _PaymentCardListState();
}

class _PaymentCardListState extends State<PaymentCardList> {
  late SavedCard chosenCard;

  @override
  void initState() {
    super.initState();
    chosenCard = widget.cardList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.basketItemBackground,
          border: Border.all(
            color: Colors.transparent,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(Insets.s),
          ),
        ),
        child: DropdownButton(
          isExpanded: true,
          focusColor: AppColors.gray,
          underline: Container(),
          items: widget.cardList.map(
            (SavedCard card) {
              return DropdownMenuItem(
                value: card,
                child: Text(
                  card.name,
                ),
              );
            },
          ).toList(),
          icon: const Icon(Icons.keyboard_arrow_down),
          value: chosenCard,
          onChanged: (SavedCard? newValue) {
            setState(
              () {
                chosenCard = newValue!;
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hesap/logic/card/card_cubit.dart';
import 'package:hesap/data/model/saved_card.dart' as card_model;
import 'package:hesap/presentation/theme/colors.dart';
import 'package:hesap/presentation/widgets/hesap_button_animated.dart';
import 'package:hesap/presentation/widgets/hesap_correct_snack_bar.dart';
import 'package:hesap/presentation/widgets/hesap_normal_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentSavedCardItem extends StatefulWidget {
  const PaymentSavedCardItem({Key? key, required this.card}) : super(key: key);

  final card_model.SavedCard card;

  @override
  State<PaymentSavedCardItem> createState() => _PaymentSavedCardItemState();
}

class _PaymentSavedCardItemState extends State<PaymentSavedCardItem> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/card.svg',
            width: 48,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.card.number,
                  style: const TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.card.name,
                  style: const TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          HesapButtonAnimated(
              label: "Seç",
              color: Colors.green,
              filled: true,
              widthRatio: 0.15,
              onPressed: () {
                kartSec(cardNumber: widget.card.number);
                setState((){
                  context.read<CardCubit>().fetchSavedCardFromSharedPreferences();
                  context.read<CardCubit>().fetchChosenCard();
                });
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    correctSnackbar(
                        "Kartın başarıyla seçildi"),
                  );
              })
        ],
      ),
    );
  }

  Future<void> kartSec({required String cardNumber}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? kayitliKullaniciKartlari =
        prefs.getStringList('kullanici_kartlar');

    List<String> kartlar = [...kayitliKullaniciKartlari!];


    for (var cardString in kartlar) {
      var thisCardList = cardString
          .split('-'); // cardNumber - cardHolder - cardExpiryDate - cardCvv
      var thisCardNumber = thisCardList[0];
      if (thisCardNumber == cardNumber) {
        debugPrint("kartin secildi");
        await prefs.setString("kullanici_kart", cardString);
        break;
      }
    }
  }
}

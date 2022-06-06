import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hesap/cubit/card/card_cubit.dart';
import 'package:hesap/data/model/saved_card.dart' as card_model;
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/widgets/hesap_button_animated.dart';
import 'package:hesap/ui/widgets/hesap_correct_snack_bar.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSavedCardItem extends StatefulWidget {
  const ProfileSavedCardItem({Key? key, required this.card}) : super(key: key);

  final card_model.SavedCard card;

  @override
  State<ProfileSavedCardItem> createState() => _ProfileSavedCardItemState();
}

class _ProfileSavedCardItemState extends State<ProfileSavedCardItem> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SvgPicture.asset(
          //   'assets/images/card_${card.brand.name}.svg',
          //   width: 48,
          // ),
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
              label: "Sil",
              color: AppColors.magenta,
              filled: true,
              widthRatio: 0.15,
              onPressed: () {
                kartSil(cardNumber: widget.card.number);
                setState((){
                  context.read<CardCubit>().fetchSavedCardFromSharedPreferences();
                });
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    correctSnackbar(
                        "Kartın başarıyla silindi"),
                  );
              })
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SvgPicture.asset(
          //   'assets/images/card_${card.brand.name}.svg',
          //   width: 48,
          // ),
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
              label: "Sil",
              color: AppColors.magenta,
              filled: true,
              widthRatio: 0.15,
              onPressed: () {
                kartSil(cardNumber: widget.card.number);
                setState((){
                  context.read<CardCubit>().fetchSavedCardFromSharedPreferences();
                });
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    correctSnackbar(
                        "Kartın başarıyla silindi"),
                  );
              })
        ],
      ),
    );
  }

  Future<void> kartSil({required String cardNumber}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? kayitliKullaniciKartlari =
        prefs.getStringList('kullanici_kartlar');

    List<String> kartlar = [...kayitliKullaniciKartlari!];

    for (var cardString in kartlar) {
      var thisCardList = cardString
          .split('-'); // cardNumber - cardHolder - cardExpiryDate - cardCvv
      var thisCardNumber = thisCardList[0];
      if (thisCardNumber == cardNumber) {
        debugPrint("kartin silindi");
        kayitliKullaniciKartlari.remove(cardString);
        await prefs.setStringList(
            'kullanici_kartlar', kayitliKullaniciKartlari);
        debugPrint(kayitliKullaniciKartlari.toString());
        break;
      }
    }
  }
}

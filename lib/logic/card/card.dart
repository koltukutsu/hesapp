import 'package:flutter/foundation.dart';
import 'package:hesap/data/model/saved_card.dart';
import 'package:hesap/data/repository/card_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardProvider extends ChangeNotifier {
  final CardRepository _cardRepository;
  List<SavedCard> savedCards = [];
  SavedCard? chosenUserCard;

  CardProvider(this._cardRepository) {
    fetchSavedCards();
    fetchChosenCard();
  }

  fetchSavedCards() async {
    savedCards = await _cardRepository.fetchSavedCards();
    notifyListeners();
  }

  fetchSavedCardFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? kayitliKullaniciKartlari =
    prefs.getStringList('kullanici_kartlar');

    savedCards = [];
    if (kayitliKullaniciKartlari != null) {
      for (var cardString in kayitliKullaniciKartlari) {
        var cardList = cardString
            .split('-'); // cardNumber - cardHolder - cardExpiryDate - cardCvv
        savedCards.add(
          SavedCard(
            name: cardList[1],
            number: cardList[0],
            // brand: CardBrand.values.byName(value['brand']),
          ),
        );
      }
    }
    notifyListeners();
  }

  fetchChosenCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? chosenCardAsString = prefs.getString('kullanici_kart');
    var splittedChosenCardAsString = chosenCardAsString!.split("-");
    chosenUserCard = SavedCard(
        name: splittedChosenCardAsString[1],
        number: splittedChosenCardAsString[0]);
    notifyListeners();
  }
}
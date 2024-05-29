import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hesap/data/model/saved_card.dart';
import 'package:hesap/data/repository/card_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  final CardRepository _cardRepository;

  CardCubit(this._cardRepository) : super(CardInitial());

  fetchSavedCards() async {
    List<SavedCard> savedCards = await _cardRepository.fetchSavedCards();
    emit(CardLoaded(savedCards));
  }

  fetchSavedCardFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? kayitliKullaniciKartlari =
        prefs.getStringList('kullanici_kartlar');

    List<SavedCard> savedCards = [];
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
    emit(CardLoaded(savedCards));
  }

  fetchChosenCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? chosenCardAsString = prefs.getString('kullanici_kart');
    var splittedChosenCardAsString = chosenCardAsString!.split("-");
    var chosenUserCard = SavedCard(
        name: splittedChosenCardAsString[1],
        number: splittedChosenCardAsString[0]);
    emit(UserCardLoaded(chosenUserCard));
  }
}

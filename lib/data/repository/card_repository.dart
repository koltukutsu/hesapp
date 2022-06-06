import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hesap/data/model/saved_card.dart';

class CardRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<SavedCard>> fetchSavedCards() async {
    var _userId = _firebaseAuth.currentUser!.uid;

    var _userDoc =
        await _firebaseFirestore.collection('users').doc(_userId).get();

    var _cardSnapshot = await _firebaseFirestore
        .collection("users/" + _userDoc.id + "/cards")
        .get();

    List<SavedCard> savedCards = [];
    for (var value in _cardSnapshot.docs) {
      savedCards.add(
        SavedCard(
          name: value['name'],
          number: value['number'],
          // brand: CardBrand.values.byName(value['brand']),
        ),
      );
    }

    return savedCards;
  }

  addCard(
    String brand,
    String number,
  ) {
    var _userId = _firebaseAuth.currentUser!.uid;

    _firebaseFirestore
        .collection("users/$_userId/cards")
        .add({'brand': brand, 'number': number});
  }
}

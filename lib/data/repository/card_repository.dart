import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hesap/data/model/saved_card.dart';

class CardRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<SavedCard>> fetchSavedCards() async {
    List<SavedCard> savedCards = [];

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

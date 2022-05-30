import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hesap/data/model/order.dart';

class PreferencesRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Set<Order>>?> getOrderHistory() async {
    User? user = _firebaseAuth.currentUser;

    if (user == null) {
      return null;
    }

    var orderHistoryDoc = await _firebaseFirestore
        .collection('orders')
        .where("user", isEqualTo: user.uid)
        .get();

    return orderHistoryDoc.docs
        .map((doc) => {
              Order(
                id: doc.id,
                user: user.uid,
                date: doc.data()['date'],
                place: doc.data()['place'],
                sum: doc.data()['sum'],
              ),
            })
        .toList();
  }
}

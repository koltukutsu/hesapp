import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hesap/data/model/order_history.dart';

class OrderHistoryRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<OrderHistory>> fetchOrderHistory() async {
    var _userId = _firebaseAuth.currentUser!.uid;

    var _userDoc =
        await _firebaseFirestore.collection('users').doc(_userId).get();

    var _orderSnapshot = await _firebaseFirestore
        .collection("users/" + _userDoc.id + "/orders")
        .get();

    List<OrderHistory> orderList = [];
    for (var value in _orderSnapshot.docs) {
      orderList.add(
        OrderHistory(
          place: value['place'],
          date: value['date'],
          sum: value['sum'],
        ),
      );
    }

    return orderList;
  }
}

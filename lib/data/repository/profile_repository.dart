import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hesap/data/model/order.dart';

class ProfileRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Order>> fetchOrderHistory() async {
    var _userId = _firebaseAuth.currentUser!.uid;

    List<Order> orderList = [];

    var _userSnapshot = await _firebaseFirestore
        .collection('users')
        .where('id', isEqualTo: _userId)
        .get();

    var _userDoc = _userSnapshot.docs[0];

    var _orderSnapshot = await _firebaseFirestore
        .collection("users/" + _userDoc.id + "/orders")
        .get();

    for (var value in _orderSnapshot.docs) {
      orderList.add(Order(
        id: "",
        user: "",
        place: value['place'],
        date: value['date'],
        sum: value['sum'],
      ));
    }

    return orderList;
  }
}

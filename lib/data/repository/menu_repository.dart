import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hesap/data/model/product.dart';

class MenuRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<List<Product>> fetchMenu(String restaurantId) async {
    var _menuSnapshot = await _firebaseFirestore
        .collection('restoranlar/$restaurantId/menu')
        .get();

    List<Product> menu = [];
    for (var value in _menuSnapshot.docs) {
      menu.add(
        Product(
          restaurantId: restaurantId,
          productId: value.id,
          title: value['isim'],
          duration: value['sure'],
          image:
              'https://firebasestorage.googleapis.com/v0/b/hesap-app.appspot.com/o/TyZa1uLFz27YKTH7Yhy2%2F85SlUdPiNLtdGyesK5MM.jpg?alt=media&token=3791a119-b614-494e-b14d-abcf2d6be63e',
          price: value['fiyat'],
          category: '',
        ),
      );
    }

    return menu;
  }
}

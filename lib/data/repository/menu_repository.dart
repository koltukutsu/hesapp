import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hesap/data/model/product.dart';

class MenuRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<Map<String, List<Product>>> fetchMenu(String restaurantId) async {
    Map<String, List<Product>> menuMap = {};

    var menuSnapshot = await _firebaseFirestore
        .collection('restoranlar/$restaurantId/menu')
        .get();

    for (var category in menuSnapshot.docs) {
      List<Product> productList = [];

      var categorySnapshot = await _firebaseFirestore
          .collection("restoranlar/$restaurantId/menu/${category.id}/urunler")
          .get();

      for (var product in categorySnapshot.docs) {
        productList.add(
          Product(
            productId: product.id,
            title: product['isim'],
            price: product['fiyat'],
            image: product['resim'],
            duration: product['sure'],
          ),
        );
      }

      menuMap[category['kategori-isim']] = productList;
    }

    return menuMap;
  }
}

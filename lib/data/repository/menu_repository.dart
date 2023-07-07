import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hesap/data/model/product.dart';

class MenuRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<Map<String, List<Product>>> fetchMenu(String restaurantId) async {
    Map<String, List<Product>> menuMap = {};

    var menuSnapshot = await _firebaseFirestore
        .collection('restaurants/$restaurantId/menu')
        .get();
    var menudocument = await _firebaseFirestore
        .doc('restaurants/$restaurantId')
        .get();
    print("Restorant Name");
    print(menudocument["restaurant_name"]);
    print("MENU Snapshot");
    print(menuSnapshot.docs.length);
    for (var category in menuSnapshot.docs) {
      List<Product> productList = [];

      var categorySnapshot = await _firebaseFirestore
          .collection("restaurants/$restaurantId/menu/${category.id}/items")
          .get();
      print(category.id);
      for (var product in categorySnapshot.docs) {
        productList.add(
          Product(
            productId: product.id,
            explanation: product['explanation'],
            stock: product['stock'],
            title: product['name'],
            price: product['price'],
            image: product['picture_url'],
            duration: product['preparing_time'],
          ),
        );
      }
      print("HERE IS THE CATR");
      print(category);
      menuMap[category['category_name']] = productList;
    }

    return menuMap;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:hesap/data/model/product.dart';

class MenuRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<Map<String, List<Product>>> fetchMenu(String restaurantId) async {
    // Map(String, Map(String, Product))
    Map<String, List<Product>> menuMap = {};

    await _firebaseFirestore
        .collection('restoranlar/$restaurantId/menu')
        .get()
        .then(
      (menu) {
        debugPrint("MENU_SIZE: ${menu.size}");

        for (var category in menu.docs) {
          debugPrint("CATEGORY_ID: ${category.id}");

          List<Product> productList = [];

          _firebaseFirestore
              .collection(
                  "restoranlar/$restaurantId/menu/${category.id}/urunler")
              .get()
              .then(
            (products) {
              for (var urun in products.docs) {
                debugPrint("PRODUCT_ID: ${urun.id}");
                productList.add(
                  Product(
                    productId: urun.id,
                    title: urun['isim'],
                    price: urun['fiyat'],
                    image: urun['resim'],
                    duration: urun['sure'],
                  ),
                );
              }
            },
          ).then((value) => {menuMap[category['kategori-isim']] = productList});
        }
      },
    );

    debugPrint("MENU_MAP: $menuMap");

    return menuMap;

    /*
      menu.add(
        Product(
          restaurantId: restaurantId,
          productId: value.id,
          title: value['isim'],
          duration: value['sure'],
          // image:
          //     'https://firebasestorage.googleapis.com/v0/b/hesap-app.appspot.com/o/TyZa1uLFz27YKTH7Yhy2%2F85SlUdPiNLtdGyesK5MM.jpg?alt=media&token=3791a119-b614-494e-b14d-abcf2d6be63e',
          image:
              "https://www.refikaninmutfagi.com/wp-content/uploads/2021/04/3O7A3397-scaled.jpg",
          // image: value["resim"],
          price: value['fiyat'],
          category: '',
        ),
      );
    */
  }
}

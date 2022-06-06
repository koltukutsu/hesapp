import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hesap/data/model/product.dart';

class SepetRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getPeople(
    List<String> tableInfo,
    // oturan_id / oturan_ismi / alinanlar /alinan_id / adet:
    // Products[alinan_id].isim
    // Products[alinan_id].resim
    // Products[alinan_id].fiyat
    // Products[alinan_id].sure
  ) {
    String restoranId = tableInfo[0];
    String masaId = tableInfo[1];

    String query = "restoranlar/$restoranId/masalar/$masaId/oturanlar";
    // /$oturanId/alinanlar/$alinan_id

    return _firebaseFirestore.collection(query).snapshots();
  }

  Future<Product> getOrder(
      String restaurantID, String categoryID, String urunID) async {
    var urun = await _firebaseFirestore
        .collection('restoranlar/$restaurantID/menu/$categoryID/urunler')
        .doc(urunID)
        .get();

    return Product(
      productId: urunID,
      title: urun['isim'],
      price: urun['fiyat'],
      image: urun['resim'],
      duration: urun['sure'],
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getOrders(
    List<String> tableInfo,
    String userID,
  ) {
    String restoranId = tableInfo[0];
    String masaId = tableInfo[1];

    String query =
        "restoranlar/$restoranId/masalar/$masaId/oturanlar/$userID/alinanlar";

    return _firebaseFirestore.collection(query).snapshots();
  }
}

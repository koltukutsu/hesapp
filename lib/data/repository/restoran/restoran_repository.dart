import 'dart:collection';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hesap/data/model/restoran.dart';

String imageUrl1 = "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80";
String imageUrl2= "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F44%2F2019%2F08%2F26230801%2F4549578.jpg";

class RestoranRepository {


  final String localJsonPath = 'assets/data/restoranlar.json';
  List<Restoran> restoranList = [];

  Future<List<Restoran>> loadLocalJson() async {
     var restoranData = await rootBundle.loadString(localJsonPath);
     List<dynamic> decodedJson = jsonDecode(restoranData);
     print("decodedJson: $decodedJson");
     restoranList = decodedJson.map((restoran) => Restoran.fromMap(restoran)).toList();
     print("restoranList: $restoranList");
     return restoranList;
  }


}
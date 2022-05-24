import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hesap/data/model/restoran.dart';


class RestoranRepository {


  final String localJsonPath = 'assets/data/restoranlar.json';
  List<Restoran> restoranList = [];

  Future<List<Restoran>> loadLocalJson() async {
     var restoranData = await rootBundle.loadString(localJsonPath);
     List<dynamic> decodedJson = jsonDecode(restoranData);
     restoranList = decodedJson.map((restoran) => Restoran.fromJson(restoran)).toList();
     return restoranList;
  }


}
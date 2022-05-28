

import 'package:hesap/data/model/masalar.dart';
import 'package:hesap/data/model/menu.dart';

import 'konum.dart';

class Restoran {
  final int id;
  final String isim;
  final String resim;
  final String adres;
  final Konum konum;
  final int masaSayisi;
  final int toplamKapasite;
  final List<Masalar> masalar;
  final List<Menu> menu;


  Restoran({required this.id, required this.isim, required this.resim, required this.adres, required this.konum, required this.masaSayisi, required this.toplamKapasite, required this.masalar, required this.menu, });

  factory Restoran.fromJson (Map<String, dynamic> json) {

    var masalarList = json['masalar'] as List;
    var menuList = json['menu'] as List;
    return Restoran(
        id : json['id'],
        isim : json['isim'],
        resim : json['resim'],
        adres : json['adres'],
        konum : Konum.fromJson(json['konum']),
        masaSayisi : json['masa-sayisi'],
        toplamKapasite : json['toplam-kapasite'],
        masalar : masalarList.map((x) => Masalar.fromJson(x)).toList(),
        menu : menuList.map((x) => Menu.fromJson(x)).toList(),
    );
  }

/*  Map<String, dynamic> toMap() => {
    'id': id,
    'isim': isim,
    'resim': resim,
    'adres': adres,
    'konum': konum,
    'masaSayisi': masaSayisi,
    'toplamKapasite': toplamKapasite,
    'masalar' : masalar,
    'menu' : menu,
  };*/

}
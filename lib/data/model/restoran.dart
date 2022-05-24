


import 'package:geocoding/geocoding.dart';
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
  final Masalar masalar;
  final Menu menu;


  Restoran(this.id, this.isim, this.resim, this.adres, this.konum, this.masaSayisi, this.toplamKapasite, this.masalar, this.menu, );

  Restoran.fromJson (Map<String, dynamic> json)
    :   id = json['id'],
        isim = json['isim'],
        resim = json['resim'],
        adres = json['adres'],
        konum = Konum.fromJson(json['konum']),
        masaSayisi = json['masa-sayisi'],
        toplamKapasite = json['toplam-kapasite'],
        masalar = Masalar.fromJson(json['masalar']),
        menu = Menu.fromMap(json['menu']);

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
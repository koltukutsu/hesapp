import 'package:flutter/material.dart';

class Masalar {
  final int masaNo;
  final Oturanlar oturanlar;

  Masalar(this.masaNo, this.oturanlar);

  Masalar.fromJson(Map<dynamic,dynamic> json):
        masaNo = json['masa-no'],
        oturanlar = Oturanlar.fromJson(json['oturanlar']);
}

class Oturanlar {
  final String isim;
  final Siparisler siparisler;

  Oturanlar(this.isim, this.siparisler);

  Oturanlar.fromJson(Map<dynamic,dynamic> json):
      isim = json['isim'],
      siparisler = Siparisler.fromJson(json['siparisler']);
}

class Siparisler {
  final String kategori;
  final String corbaIsmi;
  final String yemekIsmi;
  final String icecekIsmi;
  final String tatliIsmi;
  final int toplamTutar;

  Siparisler(this.kategori, this.corbaIsmi, this.yemekIsmi, this.icecekIsmi,
      this.tatliIsmi, this.toplamTutar);

  Siparisler.fromJson(Map<String, dynamic> json) :
      kategori = json['kategori'],
      corbaIsmi = json['corba-ismi'],
      yemekIsmi = json['yemek-ismi'],
      icecekIsmi = json['icecek-ismi'],
      tatliIsmi = json['tatli-ismi'],
      toplamTutar = json['toplamTutar'];

}

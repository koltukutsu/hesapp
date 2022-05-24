class Menu {
  final String kategori;
  final Corbalar corbalar;
  final Yemekler yemekler;
  final Tatlilar tatlilar;
  final AraSicaklar araSicaklar;
  final Icecekler icecekler;

  Menu(this.kategori, this.corbalar, this.yemekler, this.tatlilar,
      this.araSicaklar, this.icecekler);

  Menu.fromMap(Map<String, dynamic> json)
      : kategori = json['kategori'],
        corbalar = Corbalar.fromJson(json['corbalar']),
        yemekler = Yemekler.fromJson(json['yemekler']),
        tatlilar = Tatlilar.fromJson(json['tatlilar']),
        araSicaklar = AraSicaklar.fromJson(json['araSicaklar']),
        icecekler = Icecekler.fromJson(json['icecekler']);
}

class Corbalar {
  final String isim;
  final String resim;
  final int fiyat;
  final String sure;

  Corbalar(this.isim, this.resim, this.fiyat, this.sure);

  Corbalar.fromJson (Map<String, dynamic> json)
      : isim = json['isim'],
        resim = json['resim'],
        fiyat = json['fiyat'],
        sure = json['sure'];

}

class Yemekler {
  final String isim;
  final String resim;
  final int fiyat;
  final String sure;

  Yemekler(this.isim, this.resim, this.fiyat, this.sure);

  Yemekler.fromJson(Map<String, dynamic> json)
      : isim = json['isim'],
        resim = json['resim'],
        fiyat = json['fiyat'],
        sure = json['sure'];
}

class Tatlilar {
  final String isim;
  final String resim;
  final int fiyat;
  final String sure;

  Tatlilar(this.isim, this.resim, this.fiyat, this.sure);

  Tatlilar.fromJson(Map<String, dynamic> json)
      : isim = json['isim'],
        resim = json['resim'],
        fiyat = json['fiyat'],
        sure = json['sure'];
}

class AraSicaklar {
  final String isim;
  final String resim;
  final int fiyat;
  final String sure;

  AraSicaklar(this.isim, this.resim, this.fiyat, this.sure);

  AraSicaklar.fromJson(Map<String, dynamic> json)
      : isim = json['isim'],
        resim = json['resim'],
        fiyat = json['fiyat'],
        sure = json['sure'];
}

class Icecekler {
  final String isim;
  final String resim;
  final int fiyat;
  final String sure;

  Icecekler(this.isim, this.resim, this.fiyat, this.sure);

  Icecekler.fromJson(Map<String, dynamic> json)
      : isim = json['isim'],
        resim = json['resim'],
        fiyat = json['fiyat'],
        sure = json['sure'];
}
class Menu {
  final String kategori;
  final List<Corbalar>? corbalar;
  final List<Yemekler>? yemekler;
  final List<Tatlilar>? tatlilar;
  final List<AraSicaklar>? araSicaklar;
  final List<Icecekler>? icecekler;

  Menu({required this.kategori, this.corbalar, this.yemekler, this.tatlilar,
       this.araSicaklar, this.icecekler});

  factory Menu.fromJson(Map<String, dynamic> json) {

    List? corbaList;
    corbaList != null ? json['corbalar'] as List : ['yok'];
    List? yemekList;
    yemekList != null ? json['yemekler'] as List : ['yok'];
    List? tatliList;
    tatliList != null ? json['tatlilar'] as List : ['yok'];
    List? araSicakList;
    araSicakList != null ? json['ara-sicaklar'] as List : ['yok'];
    List? iceceklerList;
    iceceklerList != null ? json['icecekler'] as List : ['yok'];
    return Menu(
        kategori : json['kategori'],
        corbalar : corbaList?.map((x) => Corbalar.fromJson(x)).toList(),
        yemekler : yemekList?.map((x) => Yemekler.fromJson(x)).toList(),
        tatlilar : tatliList?.map((x) => Tatlilar.fromJson(x)).toList(),
        araSicaklar : araSicakList?.map((x) => AraSicaklar.fromJson(x)).toList(),
        icecekler : iceceklerList?.map((x) => Icecekler.fromJson(x)).toList()
    );
  }

}

class Corbalar {
  final String isim;
  final String resim;
  final int fiyat;
  final String sure;

  Corbalar(this.isim, this.resim, this.fiyat, this.sure);

  Corbalar.fromJson (Map<String, dynamic> json)
      : isim = json['corba-ismi'],
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
      : isim = json['yemek-ismi'],
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
      : isim = json['tatli-ismi'],
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
      : isim = json['yemek-ismi'],
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
      : isim = json['icecek-ismi'],
        resim = json['resim'],
        fiyat = json['fiyat'],
        sure = json['sure'];
}
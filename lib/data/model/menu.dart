class Menu {
  final String kategori;
  final List<Corbalar>? corbalar;
  final List<Yemekler>? yemekler;
  final List<Tatlilar>? tatlilar;
  final List<AraSicaklar>? araSicaklar;
  final List<Icecekler>? icecekler;

  Menu({required this.kategori, required this.corbalar, required this.yemekler, required this.tatlilar,
      required this.araSicaklar, required this.icecekler});

  factory Menu.fromJson(Map<String, dynamic> json) {

    var corbaList = json['corbalar'] as List ?? [];
    var yemekList = json['yemekler'] as List;
    var tatliList = json['tatlilar'] as List;
    var araSicakList = json['ara-sicaklar'] as List;
    var iceceklerList = json['icecekler'] as List;
    return Menu(
        kategori : json['kategori'],
        corbalar : corbaList?.map((x) => Corbalar.fromJson(x)).toList(),
        yemekler : yemekList.map((x) => Yemekler.fromJson(x)).toList(),
        tatlilar : tatliList.map((x) => Tatlilar.fromJson(x)).toList(),
        araSicaklar : araSicakList.map((x) => AraSicaklar.fromJson(x)).toList(),
        icecekler : iceceklerList.map((x) => Icecekler.fromJson(x)).toList()
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
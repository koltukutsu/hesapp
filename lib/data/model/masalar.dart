class Masalar {
  final int masaNo;
  final List<dynamic> oturanlar;

  Masalar({required this.masaNo, required this.oturanlar});

  factory Masalar.fromJson(Map<String, dynamic> json) {
    var list = json['oturanlar'] as List;
    return Masalar(
        masaNo: json['masa-no'],
        oturanlar: list.map((x) => Oturanlar.fromJson(x)).toList());
  }
}

class Oturanlar {
  final String isim;
  final List<Siparisler> siparisler;

  Oturanlar({required this.isim, required this.siparisler});

  factory Oturanlar.fromJson(Map<String, dynamic> json) {
    var list = json['siparisler'] as List;
    return Oturanlar(
        isim: json['isim'],
        siparisler: list.map((x) => Siparisler.fromJson(x)).toList());
  }
}

class Siparisler {
  final String kategori;
  final String? corbaIsmi;
  final String? yemekIsmi;
  final String? icecekIsmi;
  final String? tatliIsmi;
  final int toplamTutar;

  Siparisler(this.kategori, this.corbaIsmi, this.yemekIsmi, this.icecekIsmi,
      this.tatliIsmi, this.toplamTutar);

  Siparisler.fromJson(Map<String, dynamic> json)
      : kategori = json['kategori'],
        corbaIsmi = json['corba-ismi'],
        yemekIsmi = json['yemek-ismi'],
        icecekIsmi = json['icecek-ismi'],
        tatliIsmi = json['tatli-ismi'],
        toplamTutar = json['toplam-tutar'];
}

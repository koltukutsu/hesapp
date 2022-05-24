class Konum {
  final String enlem;
  final String boylam;

  Konum(this.enlem, this.boylam);

  Konum.fromJson(Map<String, dynamic> json)
    : enlem = json['enlem'],
      boylam = json['boylam'];
}
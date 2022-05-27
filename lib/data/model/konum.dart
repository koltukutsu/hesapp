class Konum {
  final double enlem;
  final double boylam;

  Konum(this.enlem, this.boylam);

  Konum.fromJson(Map<String, dynamic> json)
    : enlem = json['enlem'],
      boylam = json['boylam'];
}
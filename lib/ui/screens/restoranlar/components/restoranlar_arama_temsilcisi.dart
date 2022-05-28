//necessary
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hesap/data/model/restoran.dart';
import 'package:hesap/ui/widgets/hesap_restoranlar_resimli_card.dart';

class RestoranAramaTemsilcisi extends SearchDelegate {
  RestoranAramaTemsilcisi({
    required String hintText,
    required this.liste,
    required this.konum,
  }) : super(
          searchFieldLabel: hintText,
        );
  final List<Restoran> liste;
  final Position? konum;

  isimler() {
    List restoranlar = [];
    for (int i = 0; i < liste.length; i++) {
      restoranlar.add(liste[i].isim);
    }
    return restoranlar;
  }

  int uzaklik(index) {
    double restoranEnlem = liste[index].konum.enlem;
    double restoranBoylam = liste[index].konum.boylam;
    var uzaklik = Geolocator.distanceBetween(
        konum!.latitude, konum!.longitude, restoranEnlem, restoranBoylam);
    return uzaklik.toInt();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var cafeAdi in isimler()) {
      if (cafeAdi.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(cafeAdi);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        var result = matchQuery[index];
        return ListTile(
          title: HesapResimliCard(
            isim: result,
            resim: liste.elementAt(index).resim,
            uzaklik: uzaklik(index),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var cafeAdi in isimler()) {
      if (cafeAdi.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(cafeAdi);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        var result = matchQuery[index];
        return ListTile(
          title: HesapResimliCard(
            isim: result,
            resim: liste.elementAt(index).resim,
            uzaklik: uzaklik(index),
          ),
        );
      },
    );
  }
}

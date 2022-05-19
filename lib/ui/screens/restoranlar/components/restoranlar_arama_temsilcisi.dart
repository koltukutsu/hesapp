//necessary
import 'package:flutter/material.dart';


class AramaTemsilcisi extends SearchDelegate {

  AramaTemsilcisi({
    required String hintText,
  }) : super(
    searchFieldLabel: hintText,
  );

  List restoranlar = [
    'a kafesi',
    'be kafesi',
    'ce kafesi',
    'de kafesi',
  ];

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
    for (var cafeAdi in restoranlar) {
      if (cafeAdi.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(cafeAdi);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var cafeAdi in restoranlar) {
      if (cafeAdi.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(cafeAdi);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}


import 'package:flutter/material.dart';

class AramaTemsilcisi extends SearchDelegate {
  List<String> cafeListesi = [
    'Elma Kafesi',
    'Muz Kafesi',
    'Armut Kafesi',
    'Karpuz Kafesi',
    'Portakal Kafesi',
    'Çilek Kafesi',
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
    for (var cafeAdi in cafeListesi) {
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
    for (var cafeAdi in cafeListesi) {
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
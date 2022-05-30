// necessary
import 'package:flutter/material.dart';

// components
import 'package:hesap/ui/screens/common_screen_sections/hesap_middle_side.dart';
import 'package:hesap/ui/screens/common_screen_sections/hesap_up_side.dart';
import 'package:hesap/ui/screens/siparis/components/hesap_up_side_with_search.dart';
import 'package:hesap/ui/widgets/HesapSearch.dart';

class SiparisEkran extends StatefulWidget {
  const SiparisEkran({Key? key}) : super(key: key);

  @override
  State<SiparisEkran> createState() => _SiparisEkran();
}

class _SiparisEkran extends State<SiparisEkran> {
  void _startingFunction() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startingFunction());
  }

  final Map data = {
    "Kafe Ismi": "Flutter Kafe",
    "Menu": [
      {
        "ismi": "Corbalar",
        "elemanlar": [
          {
            "ismi": "1. corba",
            "sure": "15",
            "fiyat": "15",
          },
          {
            "ismi": "2. corba",
            "sure": "5",
            "fiyat": "5",
          },
          {
            "ismi": "3. corba",
            "sure": "135",
            "fiyat": "125",
          },
          {
            "ismi": "4. corba",
            "sure": "150",
            "fiyat": "150",
          },
        ]
      },
      {
        "ismi": "Makarnalar",
        "elemanlar": [
          {
            "ismi": "1. Makarnalar",
            "sure": "15",
            "fiyat": "15",
          },
          {
            "ismi": "2. Makarnalar",
            "sure": "5",
            "fiyat": "5",
          },
          {
            "ismi": "3. Makarnalar",
            "sure": "135",
            "fiyat": "125",
          },
          {
            "ismi": "4. Makarnalar",
            "sure": "150",
            "fiyat": "150",
          },
        ]
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HesapUpSideWithSearch(
            mekanIsmi: data["Kafe Ismi"],
          ),
          HesapMiddleSide(data: data),
        ],
      )),
    );
  }
}

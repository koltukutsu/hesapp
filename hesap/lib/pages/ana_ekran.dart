// necessary
import 'package:flutter/material.dart';

// pages
import 'package:hesap/pages/ic_ekranlar/restaurantEkran.dart';
import 'package:hesap/pages/ic_ekranlar/siparis_ekran.dart';
import 'package:hesap/pages/ic_ekranlar/ekran3.dart';
import 'package:hesap/pages/ic_ekranlar/ekran4.dart';

// components
import 'package:hesap/components/elements/floatingActionButton.dart';
import 'package:hesap/components/screen_sections/hesap_bottom_navigation_bar.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int index = 0;

  void onChangedTab(int indexFromNavigationBar) {
    setState(() {
      index = indexFromNavigationBar;
    });
  }

  // TODO: FloatingActionButton kismi ayarlanmali
  void onChangedButton(int indexFromFloatingActionButton) {
    if (index > 0) {
      setState(() {
        index = 0;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      RestaurantEkran(onChangedTab: onChangedTab),
      const SiparisEkran(),
      // const Ekran3(),
      // const Ekran4(),
    ];

    return Scaffold(
      body: pages[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HesapFloatingActionButton(
        index: index,
        onChangedButton: onChangedButton,
      ),
      bottomNavigationBar: HesapBottomNavigationBar(
        index: index,
        onChangedTab: onChangedTab,
      ),
    );
  }
}

// necessary
import 'package:flutter/material.dart';
// pages
import 'package:hesap/pages/restaurantEkran.dart';
import 'package:hesap/pages/siparis_ekran.dart';
import 'package:hesap/pages/ekran3.dart';
import 'package:hesap/pages/ekran4.dart';

// components
import 'package:hesap/components/elements/hesap_floating_action_button.dart';
import 'package:hesap/components/screen_sections/hesap_bottom_navigation_bar.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int index = 0;

  final pages = <Widget>[
    const RestaurantEkran(),
    const SiparisEkran(),
    const Ekran3(),
    const Ekran4(),
  ];

  @override
  Widget build(BuildContext context) {
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

  void onChangedTab(int indexFromNavigationBar) {
    setState(() {
      index = indexFromNavigationBar;
    });
  }
  // TODO: FloatingActionButton kismi ayarlanmali
  void onChangedButton(int indexFromFloatingActionButton) {
    setState(() {
      index = 0;
    });
    // if (indexFromFloatingActionButton == 0){
    //   setState(() {
    //     index = 0;
    //   });
    // } else {
    //   setState( () {
    //     index = 0;
    //   }
    //   );
    // }
  }
}

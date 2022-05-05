// necessary
import 'package:flutter/material.dart';
import 'package:hesap/pages/ekran1.dart';
// pages
import 'package:hesap/pages/qr_okuma_ekran.dart';
import 'package:hesap/pages/siparis_ekran.dart';
import 'package:hesap/pages/ekran3.dart';
import 'package:hesap/pages/ekran4.dart';

// components
import 'package:hesap/components/elements/hesap_floating_action_button.dart';
import 'package:hesap/components/screen_sections/hesap_bottom_navigation_bar.dart';
import 'package:hesap/components/screen_sections/hesap_tap_bar_material_widget.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int index = 0;

  final pages = <Widget>[
    const Ekran1(),
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
          icon: Icons.qr_code_scanner,
          floatingActionButtonFuction: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const QrOkumaEkran()));
          }),
      bottomNavigationBar: HesapTapBarMeterialWidget(
        index: index,
        onChangedTab: onChangedTab,
      ),
    );
  }

  void onChangedTab(int value) {
    setState(() {
      index = value;
    });
  }
}

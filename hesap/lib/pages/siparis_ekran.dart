// necessary
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// components
import 'package:hesap/components/hesap_bottom_navigation_bar.dart';
import 'package:hesap/components/hesap_floating_action_button.dart';
import 'package:hesap/components/hesap_normal_text.dart';
import 'package:hesap/components/hesap_text_card.dart';
// theme
import 'package:hesap/theme/colors.dart';
import 'package:hesap/theme/insets.dart';

class SiparisEkran extends StatefulWidget {
  const SiparisEkran({Key? key}) : super(key: key);

  @override
  State<SiparisEkran> createState() => _SiparisEkran();
}

class _SiparisEkran extends State<SiparisEkran> {
  var cafeName = "Hesap Cafe";

  void _startingFunction() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startingFunction());
  }

  // @override
  // void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          HesapNormalText(text: cafeName, fontSize: Insets.l, textColor: AppColors.primary),
          HesapTextCard(text: cafeName, fontSize: Insets.xll, textColor: AppColors.lightBackground,)
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const HesapFloatingActionButton(),
      bottomNavigationBar: const HesapBottomNavigationBar(),
    );
  }
}

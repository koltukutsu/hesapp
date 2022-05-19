import 'package:flutter/material.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/util/constants.dart';
// pages
import 'package:hesap/ui/screens/ana/changing_screens/restaurantEkran.dart';
import 'package:hesap/ui/screens/ana/changing_screens/siparis_ekran.dart';

// components
import "package:hesap/ui/widgets/floatingActionButton.dart";
import 'package:hesap/ui/screens/ana/components/hesap_bottom_navigation_bar.dart';
class AnaEkranBody extends StatefulWidget {
  const AnaEkranBody({
    Key? key,
    required this.hesapUser,
  }) : super(key: key);

  final HesapUser? hesapUser;

  @override
  State<AnaEkranBody> createState() => _AnaEkranBodyState();
}

class _AnaEkranBodyState extends State<AnaEkranBody> {
  late bool isAnonymous;
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
  void initState() {
    super.initState();
    isAnonymous = widget.hesapUser == null;
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      RestaurantEkran(onChangedTab: onChangedTab),
      const SiparisEkran(),
      // const Ekran3(),
      // const Ekran4(),
    ];

    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text(isAnonymous
    //             ? "Giriş yapılmadı"
    //             : "Hoş geldin ${widget.hesapUser!.username}"),
    //         ElevatedButton(
    //           onPressed: () {
    //             Navigator.pushNamed(context, ROUTE_SIGN_IN);
    //           },
    //           child: const Text("Giriş Yap"),
    //         )
    //       ],
    //     ),
    //   ),
    // );
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

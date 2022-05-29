import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/cubit/navigation/navigation_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/ui/screens/garson/garson_cagir_ekran.dart';
import 'package:hesap/ui/screens/pop_up/pop_ekran.dart';
import 'package:hesap/ui/screens/profile/profile_screen.dart';
import 'package:hesap/ui/screens/restoranlar/restoranlar_screen.dart';
import 'package:hesap/util/constants.dart';

// pages
import 'package:hesap/ui/screens/restoran/restoran_ekran.dart';
import 'package:hesap/ui/screens/siparis/siparis_ekran.dart';

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

  @override
  void initState() {
    super.initState();
    isAnonymous = widget.hesapUser == null;
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom !=
        0.0; // floating action button bunu kullanarak yukari gitmeyecek

    final pages = <Widget>[
      // BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
      //     builder: (context, state) {
      //   return RestaurantEkran(
      //       onChangedTab:
      //           BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab);
      // }),
      // const RestoranEkran(),
      const PopUpEkran(text: "herhangi bir kafe ismi"),
      const SiparisEkran(),
      const GarsonCagirEkran(),
      const ProfileScreen()
      // const PopUpEkran(text: "herhangi bir kafe ismi  "),
    ];

    return BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
      builder: (context, state) => Scaffold(
        body: pages[state.index],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: keyboardIsOpened
            ? null
            : HesapFloatingActionButton(
                index: state.index,
              ),
        bottomNavigationBar: HesapBottomNavigationBar(
          index: state.index,
        ),
      ),
    );
  }
}

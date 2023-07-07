import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/ui/screens/garson/garson_cagir_ekran.dart';
import 'package:hesap/ui/screens/masada_oturanlar/masa_temel_ekran.dart';
import 'package:hesap/ui/screens/menu/menu_ekran.dart';
import 'package:hesap/ui/screens/pop_up/pop_ekran.dart';
import 'package:hesap/ui/screens/profile/profile_screen.dart';
import 'package:hesap/ui/screens/sepet/order_screen.dart';

// pages

// components
import "package:hesap/ui/widgets/floatingActionButton.dart";
import 'package:hesap/ui/screens/ana/components/hesap_bottom_navigation_bar.dart';

class AnaEkranBody extends StatefulWidget {
  const AnaEkranBody({
    Key? key,
  }) : super(key: key);

  @override
  State<AnaEkranBody> createState() => _AnaEkranBodyState();
}

class _AnaEkranBodyState extends State<AnaEkranBody> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom !=
        0.0; // floating action button bunu kullanarak yukari gitmeyecek

    final pages = <Widget>[
      // const SizedBox(),
      const MasaTemelEkran(), // 0
      const MenuEkran(), // 1
      // const OrderScreen(), // 1
      const GarsonCagirEkran(), // 2
      const ProfileScreen() // 3
      // const PopUpEkran(text: "herhangi bir kafe ismi  "),
    ];

    return BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
      builder: (context, state) => Scaffold(
        appBar: null,
        body:pages[state.index],

        // AnimatedSwitcher(
        //     duration: const Duration(milliseconds: 280),
        //     transitionBuilder: (Widget child, Animation<double> animation) {
        //       return SlideTransition(
        //         position: // TODO: ekranin saga mi sola mi gectigini kontrol icin bir onceki degeri bilmemiz gerekiyor
        //             Tween<Offset>(
        //                     begin: const Offset(1.2, 0),
        //                     end: const Offset(0.0, 0))
        //                 .animate(animation),
        //         child: child,
        //       );
        //     },
        //     child: pages[state.index]),

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

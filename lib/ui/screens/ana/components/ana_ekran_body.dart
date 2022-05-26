import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
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

  // void onChangedTab(int indexFromNavigationBar) {
  //   setState(() {
  //     index = indexFromNavigationBar;
  //   });
  // }

  // TODO: FloatingActionButton kismi ayarlanmali
  // void onChangedButton(int indexFromFloatingActionButton) {
  //   if (index > 0) {
  //     setState(() {
  //       index = 0;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    isAnonymous = widget.hesapUser == null;
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
          builder: (context, state) {
        return RestaurantEkran(
            onChangedTab:
                BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab);
      }),
      const SiparisEkran(),
      // const Ekran3(),
      // const Ekran4(),
    ];

    return BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
      builder: (context, state) => Scaffold(
        body: pages[state.index],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: HesapFloatingActionButton(
          index: state.index,
          onChangedButton:
              BlocProvider.of<DegisenEkranlarCubit>(context).onChangedButton,
          // onChangedButton: onChangedButton,
        ),
        bottomNavigationBar: HesapBottomNavigationBar(
          index: state.index,
          onChangedTab:
              BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab,
        ),
      ),
    );
  }
}

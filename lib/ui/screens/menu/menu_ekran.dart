// necessary

import 'package:flutter/material.dart';

// components
import 'package:hesap/ui/screens/menu/components/menu_body.dart';
import 'package:hesap/ui/screens/menu/components/menu_header.dart';

class MenuEkran extends StatefulWidget {
  const MenuEkran({Key? key}) : super(key: key);

  @override
  State<MenuEkran> createState() => _MenuEkranState();
}

class _MenuEkranState extends State<MenuEkran> {
  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text("Menü"),
      //   backgroundColor: AppColors.primary,
      // ),
        body: MenuBody(
          restaurantId: "Y6Soer2POVTako14DN4Q",
        ));
    // return Scaffold(
    //     // appBar: AppBar(
    //     //   title: const Text("Menü"),
    //     //   backgroundColor: AppColors.primary,
    //     // ),
    //     body: CustomScrollView(
    //         slivers: [
    //           const SliverMenuHeader(),
    //           SliverList(
    //             delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
    //               return const MenuBody(
    //                 restaurantId: "TyZa1uLFz27YKTH7Yhy2",
    //               );
    //     },childCount: 1,
    //     ),
    //   ),
    // ]));
  }
}

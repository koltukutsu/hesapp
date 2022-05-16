// necessary
import 'package:flutter/material.dart';
import 'package:hesap/ui/screens/restoranlar/components/restoranlar_sliver_list.dart';
import 'package:hesap/ui/screens/restoranlar/components/restoranlar_sliver_persistent_header.dart';

// components


class RestaurantEkran extends StatefulWidget {
  const RestaurantEkran({Key? key}) : super(key: key);

  @override
  State<RestaurantEkran> createState() => _RestaurantEkran();
}

class _RestaurantEkran extends State<RestaurantEkran> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverHeader(),
            SliverListesi(),
          ],
        ),
      ),
    );
  }
}





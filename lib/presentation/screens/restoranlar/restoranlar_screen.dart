// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/logic/konum/konum_cubit.dart';
import 'package:hesap/logic/restoran/restoran_cubit.dart';
import 'package:hesap/presentation/screens/restoranlar/components/restoranlar_sliver_list.dart';
import 'package:hesap/presentation/screens/restoranlar/components/restoranlar_sliver_persistent_header.dart';

// components

class RestoranEkran extends StatefulWidget {
  const RestoranEkran({Key? key}) : super(key: key);

  @override
  State<RestoranEkran> createState() => _RestaurantEkran();
}

class _RestaurantEkran extends State<RestoranEkran> {
  @override
  void initState() {
    super.initState();
    context.read<KonumCubit>().getLocation();
    context.read<RestoranCubit>().initialize();
    // context.read<KonumCubit>().checkPermission();
  }

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

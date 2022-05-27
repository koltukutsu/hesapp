import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hesap/cubit/restoran/restoran_cubit.dart';
import 'package:hesap/ui/widgets/hesap_restoranlar_resimli_card.dart';

class SliverListesi extends StatelessWidget {
  SliverListesi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestoranCubit, RestoranState>(
      builder: (context, state) {
        if (state is RestoranYuklendi) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              double restoranEnlem = state.restoranList[index].konum.enlem;
              double restoranBoylam = state.restoranList[index].konum.boylam;
              var uzaklik = Geolocator.distanceBetween(state.konum!.latitude,
                  state.konum!.longitude, restoranEnlem, restoranBoylam);
              return HesapResimliCard(
                isim: state.restoranList[index].isim,
                resim: state.restoranList[index].resim,
                uzaklik: uzaklik.toInt(),
              );
          }, childCount: state.restoranList.length));
        } else if (state is RestoranYukleniyor) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return const Center(child: CircularProgressIndicator());
            },
            childCount: 1,
          ));
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const Text('Lütfen Konum Bilgisine İzin veriniz');
              },
              childCount: 1,
            ),
          );
        }
      },
    );
  }
}

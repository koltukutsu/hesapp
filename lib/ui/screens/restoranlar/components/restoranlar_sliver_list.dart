
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hesap/cubit/restoran/restoran_cubit.dart';
import 'package:hesap/data/repository/restoran/restoran_repository.dart';
import 'package:hesap/ui/widgets/hesap_restoranlar_resimli_card.dart';

class SliverListesi extends StatelessWidget {
  const SliverListesi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RestoranCubit, RestoranState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context,
              int index) {
            return BlocBuilder<RestoranCubit, RestoranState>(
              builder: (context, state) {
                if (state is RestoranYuklendi) {
                  double restoranEnlem = state.restoranList[index].konum.enlem;
                  double restoranBoylam = state.restoranList[index].konum.boylam;
                  var uzaklik = Geolocator.distanceBetween(state.konum!.latitude, state.konum!.longitude, restoranEnlem, restoranBoylam);

                  return HesapResimliCard(
                    isim: state.restoranList[index].isim,
                    resim: state.restoranList[index].resim,
                    uzaklik: uzaklik.toInt(),
                  );
                } else if (state is RestoranYukleniyor) {
                  return const CircularProgressIndicator();
                } else {
                  return const SizedBox();
                }
              },
            );
          },
            childCount: 4,
          )
      ),
    );
  }
}
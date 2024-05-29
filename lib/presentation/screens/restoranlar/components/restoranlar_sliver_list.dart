import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hesap/logic/konum/konum_cubit.dart';
import 'package:hesap/logic/restoran/restoran_cubit.dart';
import 'package:hesap/data/repository/konum/konum_repository.dart';
import 'package:hesap/presentation/widgets/hesap_restoranlar_resimli_card.dart';

class SliverListesi extends StatefulWidget {
  const SliverListesi({
    Key? key,
  }) : super(key: key);


  @override
  State<SliverListesi> createState() => _SliverListesiState();
}

class _SliverListesiState extends State<SliverListesi> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestoranCubit, RestoranState>(
      builder: (context, state) {
        if (state is RestoranYuklendi) {
          double restoranEnlem(index) => state.restoranList[index].konum.enlem;
          double restoranBoylam(index) => state.restoranList[index].konum.boylam;
          final restoranList = state.restoranList;
          return BlocBuilder<KonumCubit, KonumState>(
            builder: (context, state) {
              if (state is KonumYuklendi) {
                final konum = state.konum;
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          for (int i=0; i < restoranList.length; i++) {
                            restoranList[i].uzaklik  = Geolocator.distanceBetween(
                                konum!.latitude,
                                state.konum!.longitude,
                                restoranEnlem(i),
                                restoranBoylam(i)).toInt();
                          }
                          int siralama<Restoran> (x,y) => x.uzaklik!.compareTo(y.uzaklik!);
                          restoranList.sort(siralama);
                  return HesapResimliCard(
                    isim: restoranList[index].isim,
                    resim: restoranList[index].resim,
                    uzaklik: restoranList[index].uzaklik,
                  );
                }, childCount: restoranList.length));
              } else if (state is KonumYukleniyor) {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return const Center(child: CircularProgressIndicator());
                      },
                      childCount: 1,
                    ));
              } else {
                KonumRepository().checkPermission();
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return const Center(child: Text('Lütfen Konum Bilgisine İzin veriniz'));
                    },
                    childCount: 1,
                  ),
                );
              }
            }
          );
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

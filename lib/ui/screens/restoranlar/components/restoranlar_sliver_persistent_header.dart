import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hesap/cubit/konum/konum_cubit.dart';
import 'package:hesap/cubit/restoran/restoran_cubit.dart';
import 'package:hesap/data/repository/konum/konum_repository.dart';
import 'package:hesap/ui/screens/restoranlar/components/restoranlar_arama_temsilcisi.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/util/constants.dart';

class SliverHeader extends StatefulWidget {
  const SliverHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<SliverHeader> createState() => _SliverHeaderState();
}

class _SliverHeaderState extends State<SliverHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverAppBar(),
      pinned: true,
    );
  }
}

class SliverAppBar extends SliverPersistentHeaderDelegate {
  static const double maxYukseklik = 300;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) - 20;
    double topPadding = MediaQuery.of(context).padding.top + 250;

    return Stack(
      children: [
        MaviKisim1(topPadding: topPadding),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset('assets/images/background.svg'),
        ),
        const UserIkonu(),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: const [
                HesapYazisi(),
              ],
            ),
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: KonumBilgisi(),
        ),
        QRKodOkutma(offset: offset),
        YakinimdakiMekanlar(offset: offset),
      ],
    );
  }

  @override
  double get maxExtent => maxYukseklik;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}

class KonumBilgisi extends StatelessWidget {
  const KonumBilgisi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: AppColors.white,
          size: 25,
        ),
        BlocBuilder<KonumCubit, KonumState>(
          builder: (context, state) {
            if (state is KonumYuklendi) {
              return Text(
                '${state.adres?.first.street.toString()}, ${state.adres?.first.locality}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w300),
              );
            } else if (state is KonumYukleniyor) {
              return const Center(child: Text('Konum Yükleniyor...'));
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}

class MaviKisim1 extends StatelessWidget {
  const MaviKisim1({
    Key? key,
    required this.topPadding,
  }) : super(key: key);

  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.05,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: topPadding - 55,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class UserIkonu extends StatelessWidget {
  const UserIkonu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: IconButton(
        icon: const Icon(
          Icons.person,
          color: AppColors.white,
        ),
        onPressed: () {},
        iconSize: 36,
      ),
    );
  }
}

class HesapYazisi extends StatelessWidget {
  const HesapYazisi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'hesap',
      style: TextStyle(
        fontFamily: 'Ubuntu',
        color: AppColors.white,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class QRKodOkutma extends StatelessWidget {
  const QRKodOkutma({
    Key? key,
    required this.offset,
  }) : super(key: key);

  final double offset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120 + offset,
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.82,
            height: 90,
            margin: const EdgeInsets.only(bottom: 6.0),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gray,
                    offset: Offset(0.0, 2.5),
                    blurRadius: 6.0,
                  )
                ]),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(ROUTE_QR_SCREEN);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.all(18),
                      alignment: Alignment.center,
                      child: const Text(
                        'Menüyü görüntülemek için QR kodu okutun',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.darkBackground,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.qr_code,
                      size: 60,
                      color: AppColors.darkBackground,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class YakinimdakiMekanlar extends StatelessWidget {
  const YakinimdakiMekanlar({
    Key? key,
    required this.offset,
  }) : super(key: key);

  final double offset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 115 + offset,
      right: 10,
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 30,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Yakındaki Mekanlar',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: ' Ubuntu',
                    color: AppColors.darkBackground,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: BlocBuilder<RestoranCubit, RestoranState>(
                  builder: (context, state) {
                    if (state is RestoranYuklendi) {
                      var restoranList = state.restoranList;
                      double restoranEnlem(index) =>
                          state.restoranList[index].konum.enlem;
                      double restoranBoylam(index) =>
                          state.restoranList[index].konum.boylam;
                      return BlocBuilder<KonumCubit, KonumState>(
                          builder: (context, state) {
                        if (state is KonumYuklendi) {
                          var konum = state.konum;
                          for (int i = 0; i < restoranList.length; i++) {
                            restoranList[i].uzaklik =
                                Geolocator.distanceBetween(
                                        konum!.latitude,
                                        state.konum!.longitude,
                                        restoranEnlem(i),
                                        restoranBoylam(i))
                                    .toInt();
                          }
                          int siralama<Restoran>(x, y) =>
                              x.uzaklik!.compareTo(y.uzaklik!);
                          restoranList.sort(siralama);
                          return IconButton(
                            icon: const Icon(
                              Icons.search,
                              size: 32,
                              color: AppColors.darkBackground,
                            ),
                            onPressed: () {
                              showSearch(
                                context: context,
                                delegate: RestoranAramaTemsilcisi(
                                  hintText: 'Restoran Ara',
                                  liste: restoranList,
                                  konum: konum,
                                ),
                              );
                            },
                          );
                        } else if (state is KonumYukleniyor) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is KonumYuklenemedi) {
                          KonumRepository().checkPermission();
                          return const Center(child: Text('Konum Yok'));
                        } else {
                          return const Center(child: Text('Hata'));
                        }
                      });
                    } else if (state is RestoranYukleniyor) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(child: Text('Hata'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

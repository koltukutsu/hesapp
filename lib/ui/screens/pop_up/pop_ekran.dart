// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/cubit/restoran/restoran_cubit.dart';

// import 'package:flutter/services.dart';
import 'package:hesap/ui/widgets/hesap_button_not_flexible.dart';
import 'package:hesap/ui/screens/pop_up/components/hesap_middle_side2.dart';

// component
import 'package:hesap/ui/screens/common_screen_sections/hesap_up_side.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';
import 'package:hesap/util/constants.dart';

class PopUpEkran extends StatefulWidget {
  const PopUpEkran({Key? key, required this.restoranId, required this.masaId})
      : super(key: key);
  final int restoranId;
  final int masaId;

  @override
  State<PopUpEkran> createState() => _PopUpEkran();
}

class _PopUpEkran extends State<PopUpEkran> {
  void _startingFunction() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startingFunction());
    context.read<RestoranCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    int restoranId = widget.restoranId;
    int masaId = widget.masaId;
    return Scaffold(
      body: BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
          builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 150,
              child: BlocBuilder<RestoranCubit, RestoranState>(
                builder: (context, state) {
                  if (state is RestoranYuklendi) {
                    List restoranListesi = state.restoranList;
                    return CustomScrollView(
                      slivers: [
                        SliverUpSide(
                            restoran: restoranListesi[restoranId],
                            masaId: masaId),
                        HesapMiddleSide2(
                            restoran: restoranListesi[restoranId],
                            masaId: masaId),
                        // HesapMiddleSide(data: data),
                      ],
                    );
                  } else if (state is RestoranYukleniyor) {
                    return const HesapNormalText(
                        text: 'Restoran Verisi Yükleniyor');
                  } else {
                    return const Text('HATA');
                  }
                },
              ),
            ),
            const MasayaOturun(),
            const Iptal(),
          ],
        );
      }),
    );
  }
}

class MasayaOturun extends StatelessWidget {
  const MasayaOturun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 300,
      child: HesapButtonNotFlexible(
        label: 'Masaya Oturun',
        filled: true,
        textSize: 24,
        onPressed: () {
          // Navigator.of(context).pop();
          //   Navigator.pop(context, 1);
          BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(1);
          // Navigator.of(context).popUntil(ModalRoute.withName(ROUTE_RESTAURANTS));
          Navigator.of(context).popAndPushNamed(ROUTE_MAIN);
          // Navigator.of(context).pop();
          //TODO: Buradan veriler sipariş ekranına yollansın. DUZELTME: BLOCPROVIDER ile halledebiliriz, veri yollamaya gerek yok
        },
      ),
    );
  }
}

class Iptal extends StatelessWidget {
  const Iptal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 200,
      child: HesapButtonNotFlexible(
        label: 'İptal',
        filled: false,
        textSize: 24,
        onPressed: () {
          // Navigator.of(context).pop(0);
          // BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(0); //TODO: 1. sayfayla ilgili olan ve restoran kismina donme

          BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(1);
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          //  Navigator.of(context).popUntil(ModalRoute.withName(ROUTE_RESTAURANTS));
          // Navigator.of(context)
          //     .popUntil(ModalRoute.withName(ROUTE_RESTAURANTS));
        },
      ),
    );
  }
}

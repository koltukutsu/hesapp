import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/restoran/restoran_cubit.dart';
import 'package:hesap/data/model/restoran.dart';
import 'package:hesap/data/model/restoran.dart';
import 'package:hesap/ui/widgets/hesap_restoranlar_resimli_card.dart';

class SliverListesi extends StatelessWidget {
  const SliverListesi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return BlocBuilder<RestoranCubit, RestoranState>(
            builder: (context, state) {
              if (state is RestoranYuklendi) {
                return HesapResimliCard(
                  text: state.restoranList[index].name,
                );
              } else {
                return Text('Merhaba');
              }
            },
          );
        },
          childCount: 3,
        )
    );
  }
}
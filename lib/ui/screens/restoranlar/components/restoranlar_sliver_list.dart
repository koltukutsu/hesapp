import 'package:flutter/material.dart';
import 'package:hesap/ui/widgets/hesap_restoranlar_resimli_card.dart';

class SliverListesi extends StatelessWidget {
  const SliverListesi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return const HesapResimliCard();
        },
          childCount: 20,
        )
    );
  }
}
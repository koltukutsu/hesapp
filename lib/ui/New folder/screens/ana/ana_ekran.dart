import 'package:flutter/material.dart';
import 'package:hesap/ui/screens/ana/components/ana_ekran_body.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return const AnaEkranBody();
  }
}

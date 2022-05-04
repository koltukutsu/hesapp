import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hesap/components/hesap_header_text.dart';

class SiparisEkran extends StatefulWidget {
  const SiparisEkran({Key? key}) : super(key: key);

  @override
  State<SiparisEkran> createState() => _SiparisEkran();
}

class _SiparisEkran extends State<SiparisEkran> {
  void _startingFunction() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startingFunction());
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [],
      )),
    );
  }
}

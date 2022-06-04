// necessary
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';
import 'package:hesap/ui/widgets/hesap_button.dart';

// import 'package:flutter/services.dart';
import 'package:hesap/ui/widgets/hesap_button_not_flexible.dart';
import 'package:hesap/ui/screens/pop_up/components/hesap_middle_side2.dart';

// component
import 'package:hesap/ui/screens/common_screen_sections/hesap_up_side.dart';
import 'package:hesap/util/constants.dart';

class PopUpEkran extends StatefulWidget {
  const PopUpEkran({Key? key, required this.qrStream}) : super(key: key);

  final Stream<QuerySnapshot<Map<String, dynamic>>> qrStream;

  @override
  State<PopUpEkran> createState() => _PopUpEkran();
}

class _PopUpEkran extends State<PopUpEkran> {
  void _startingFunction() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _startingFunction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 150,
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                HesapMiddleSide2(
                  qrStream: widget.qrStream,
                ),
              ],
            )),
          ),
          const MasayaOturun(),
          const Iptal(),
        ],
      ),
    );
  }
}

class MasayaOturun extends StatelessWidget {
  const MasayaOturun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: HesapButton(
        label: 'Masaya Oturun',
        filled: true,
        onPressed: () {
          Navigator.of(context).pushNamed(ROUTE_MAIN);
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: HesapButton(
        label: 'İptal',
        filled: false,
        onPressed: () {
          context.read<QRCubit>().leaveTable();
          Navigator.of(context).popUntil(ModalRoute.withName(ROUTE_BASE));
        },
      ),
    );
  }
}

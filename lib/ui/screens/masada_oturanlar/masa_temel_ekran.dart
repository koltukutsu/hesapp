// necessary
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/cubit/masa/masa_cubit.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';
import 'package:hesap/ui/widgets/hesap_button.dart';

// import 'package:flutter/services.dart';
import 'package:hesap/ui/screens/masada_oturanlar/components/hesap_middle_side2.dart';

// component
import 'package:hesap/util/constants.dart';

class MasaTemelEkran extends StatefulWidget {
  const MasaTemelEkran({Key? key}) : super(key: key);

  @override
  State<MasaTemelEkran> createState() => _MasaTemelEkran();
}

class _MasaTemelEkran extends State<MasaTemelEkran> {
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
                  const SizedBox(
                    height: 100,
                  ),
                  HesapMiddleSide2(
                    qrStream: context.read<MasaCubit>().getPeopleOnTable(),
                  ),
                ],
              ),
            ),
          ),
          // const MasayaOturun(),
          // const Iptal(),
          const AnaEkranaDon(),
        ],
      ),
    );
  }
}

class AnaEkranaDon extends StatelessWidget {
  const AnaEkranaDon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: HesapButton(
        label: 'Masadan Kalk',
        filled: true,
        onPressed: () {
          // Navigator.of(context).push
          // context.read<QRCubit>().sitAtTableTest();
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     ROUTE_MAIN, (Route<dynamic> route) => false);
          //context.read<QRCubit>().leaveTable();
          BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(1);
          Navigator.of(context).pushNamedAndRemoveUntil(
              ROUTE_RESTAURANTS, (Route<dynamic> route) => false);
        },
      ),
    );
  }
}

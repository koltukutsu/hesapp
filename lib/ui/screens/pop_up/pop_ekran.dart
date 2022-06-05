// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/masa/masa_cubit.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';
import 'package:hesap/ui/widgets/hesap_button.dart';

// import 'package:flutter/services.dart';
import 'package:hesap/ui/screens/pop_up/components/hesap_middle_side2.dart';
import 'package:hesap/ui/widgets/hesap_button_animated.dart';

// component
import 'package:hesap/util/constants.dart';

class PopUpEkran extends StatefulWidget {
  const PopUpEkran({
    Key? key,
    //required this.qrData,
  }) : super(key: key);

  //final List<String> qrData;

  @override
  State<PopUpEkran> createState() => _PopUpEkran();
}

class _PopUpEkran extends State<PopUpEkran> {
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
      child: HesapButtonAnimated(
        label: "Masaya Oturun",
        filled: true,
        onPressed: () {
          context.read<MasaCubit>().sitAtTableTest();
          Navigator.of(context).pushNamedAndRemoveUntil(
              ROUTE_MAIN, (Route<dynamic> route) => false);
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
      child: HesapButtonAnimated(
        label: 'İptal',
        filled: false,
        onPressed: () {
          //context.read<QRCubit>().leaveTable();
          Navigator.of(context).pushNamedAndRemoveUntil(
              ROUTE_RESTAURANTS, (Route<dynamic> route) => false);
        },
      ),
    );
  }
}

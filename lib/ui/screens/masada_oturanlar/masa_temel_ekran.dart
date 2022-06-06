// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/cubit/masa/masa_cubit.dart';
import 'package:hesap/ui/theme/colors.dart';

// import 'package:flutter/services.dart';
import 'package:hesap/ui/screens/masada_oturanlar/components/hesap_middle_side_masa.dart';
import 'package:hesap/ui/widgets/hesap_button_animated.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';
import 'package:hesap/ui/widgets/hesap_text_card.dart';

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
      appBar: AppBar(
        title: const Text("Masadakiler"),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          HesapNormalText(
              text: context.read<MasaCubit>().restaurantName,
              fontSize: 32,
              textColor: AppColors.primary,
              paddingTop: 10,
              paddingBottom: 10),
          HesapTextCard(
              text: "Masa ${context.read<MasaCubit>().tableName}",
              cardColor: AppColors.primary,
              textColor: AppColors.white,
              paddingTop: 10,
              paddingBottom: 10,
              fontSize: 28),
          SizedBox(
            // height: MediaQuery.of(context).size.height - 150,
            // height: MediaQuery.of(context).size.height * 0.1,
            child: Column(
              children: [
                // const SizedBox(
                //   height: 100,
                // ),
                HesapMiddleSideMasa(
                  qrStream: context.read<MasaCubit>().getPeopleOnTable(),
                ),
              ],
            ),
          ),
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
      child: HesapButtonAnimated(
        label: 'Masadan Kalk',
        filled: true,
        onPressed: () {
          BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(1);
          Navigator.of(context).pushNamedAndRemoveUntil(
              ROUTE_RESTAURANTS, (Route<dynamic> route) => false);
        },
      ),
    );
  }
}

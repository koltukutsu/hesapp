// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/masa/masa_cubit.dart';

// import 'package:flutter/services.dart';
import 'package:hesap/ui/screens/pop_up/components/hesap_middle_side_pop_up.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/widgets/hesap_button_animated.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';
import 'package:hesap/ui/widgets/hesap_text_card.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HesapNormalText(
                text: context.read<MasaCubit>().restaurantName,
                fontSize: 32,
                textColor: AppColors.primary,
                paddingTop: 10,
              ),
              // paddingBottom: 10),
              HesapTextCard(
                  text: "Masa ${context.read<MasaCubit>().tableName}",
                  cardColor: AppColors.primary,
                  textColor: AppColors.white,
                  paddingTop: 10,
                  // paddingBottom: 10,
                  fontSize: 28),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    HesapMiddleSidePopUp(
                      qrStream: context.read<MasaCubit>().getPeopleOnTable(),
                    ),
                  ],
                ),
              ),
              const MasayaOturun(),
              const Iptal(),
            ],
          ),
        ),
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
          context
              .read<MasaCubit>()
              .sitAtTableTest(context.read<AuthCubit>().hesapUser!);
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
          context
              .read<MasaCubit>()
              .leaveTable(context.read<AuthCubit>().hesapUser!);
          Navigator.of(context).pushNamedAndRemoveUntil(
              ROUTE_RESTAURANTS, (Route<dynamic> route) => false);
        },
      ),
    );
  }
}

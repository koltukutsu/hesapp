import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hesap/logic/sepet/sepet_cubit.dart';
import 'package:hesap/presentation/screens/odeme/components/order_is_done_alert.dart';
import 'package:hesap/presentation/screens/odeme/payment_screen.dart';
import 'package:hesap/presentation/theme/colors.dart';
import 'package:hesap/presentation/widgets/hesap_button_animated.dart';
import 'package:hesap/util/animated_route.dart';
import 'package:hesap/util/constants.dart';

class SepetFooter extends StatefulWidget {
  const SepetFooter({
    Key? key,
  }) : super(key: key);

  @override
  State<SepetFooter> createState() => _SepetFooterState();
}

class _SepetFooterState extends State<SepetFooter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Column(
            children: [
              SvgPicture.asset("assets/images/sepet_divider.svg",
                  width: MediaQuery.of(context).size.width),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Not Ekle',
                    labelStyle: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 16,
                        color: AppColors.gray),
                  ),
                ),
              ),
              SvgPicture.asset("assets/images/sepet_divider.svg",
                  width: MediaQuery.of(context).size.width),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 7, top: 14, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Toplam Tutar:",
                      style: TextStyle(fontSize: 20, fontFamily: 'ubuntu'),
                    ),
                    SizedBox(
                      height: 48,
                      width: 84,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: AppColors.amountBox,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "${context.watch<SepetCubit>().calculateOrderSum()} tl",
                            style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    HesapButtonAnimated(
                      label: "ÖDE",
                      onPressed: () {
                        Navigator.push(
                            context,
                            FadeInRoute(
                                page: const PaymentScreen(),
                                routeName: ROUTE_PAYMENT));
                      },
                      // Navigator.pushNamed(context, ROUTE_PAYMENT),
                      filled: true,
                      enabled: true,
                      height: 50,
                      widthRatio: 0.25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

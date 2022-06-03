import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hesap/ui/screens/ana/components/hesap_alert_dialog.dart';
import 'package:hesap/ui/screens/odeme/components/order_is_done_alert.dart';
import 'package:hesap/ui/screens/sepet/components/orders_list.dart';
import 'package:hesap/ui/theme/colors.dart';

class SepetFooter extends StatefulWidget {
  String total="";

  SepetFooter(this.total) {}

  @override
  State<SepetFooter> createState() => _SepetFooterState(total);
}

class _SepetFooterState extends State<SepetFooter> {
  String total="";
  _SepetFooterState(this.total){}

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
                padding:  EdgeInsets.only(left: 13.0),
                child: TextFormField(
                  decoration:  InputDecoration(
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
                        child:  Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            total,
                            style: const TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48.0,
                      width: 84,
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO: alertDialog eklenecek, odeme tamamlandi
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const OrderDoneAlertDialog());
                        },
                        child: const Text(
                          "ÖDE",
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: AppColors.white),
                        ),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: AppColors.primary),
                      ),
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

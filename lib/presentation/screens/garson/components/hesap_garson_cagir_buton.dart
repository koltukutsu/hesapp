import 'package:flutter/material.dart';
import 'package:hesap/presentation/theme/colors.dart';
import 'package:hesap/presentation/widgets/hesap_information_snack_bar.dart';

class HesapGarsonCagirButton extends StatelessWidget {
  const HesapGarsonCagirButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            informationSnackbar(
                "Garson Çağrıldı. Garsonumuz sizinle ilgilenecektir."),
          );
      }, // TODO: Fonksiyonellik eklenecek
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          margin:
              const EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
              child: Transform.scale(
                  scale: 3.6,
                  child: const Icon(
                    Icons.add_alert_outlined,
                    color: AppColors.primary,
                  ))),
        ),
      ),
    );
  }
}

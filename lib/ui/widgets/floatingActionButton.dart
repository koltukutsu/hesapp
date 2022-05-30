// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/ui/screens/qr_code/qr_okuma_ekran.dart';
import 'package:hesap/ui/screens/qr_scanner/qr_scanner_screen.dart';
import 'package:hesap/ui/widgets/hesap_correct_snack_bar.dart';
import 'package:hesap/ui/widgets/hesap_information_snack_bar.dart';
import 'package:hesap/util/constants.dart';

// pages
// import 'package:hesap/ui/screens/qr_scanner/qr_scanner_screen.dart';

class HesapFloatingActionButton extends StatefulWidget {
  // const HesapFloatingActionButton(
  //     {Key? key, required this.index, required this.onChangedButton})
  //     : super(key: key);
  const HesapFloatingActionButton({Key? key, required this.index})
      : super(key: key);
  final int index;

  // final ValueChanged<int> onChangedButton;

  // void _floatingActionButtonFuction() {}
  // required this.floatingActionButtonFuction, this.icon = Icons.qr_code_scanner
  @override
  State<HesapFloatingActionButton> createState() =>
      _HesapFloatingActionButton();
}

class _HesapFloatingActionButton extends State<HesapFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return buildFloatingActionButton(index: widget.index);
  }

  Widget buildFloatingActionButton({required int index}) {
    if (index == 1) {
      return FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text("Yeni Restorana Geçme"),
              content: const Text("Yeni Restorana Geçmek İstiyor musun?"),
              actions: [
                TextButton(
                  child: const Text("Hayır"),
                  onPressed: () {
                    // context.read<ProfileCubit>().toggleEditMode();
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                        informationSnackbar("Restorandan Çıkılmadı"));
                    // buraya eski hallerine getirilmesi icin bir ozellik eklenmesi lazim, ufak bir fonksiyon ile halledilir
                    // TODO: ozelligi eklemeye gerek kalmadi, otomatik olarak halledildi
                  },
                ),
                TextButton(
                  child: const Text("Geç"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(correctSnackbar("Restorandan Çıkıldı"));
                    Navigator.of(context).popUntil(ModalRoute.withName(
                        ROUTE_RESTAURANTS)); // TODO: qr okuma floating action butonuna tiklayinca ilk restoranlar sayfasina yonlendirsin mi??
                    Navigator.of(context).pushNamed(ROUTE_QR_SCREEN);
                  },
                )
              ],
            ),
          );

          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => const QRScannerScreen()));
        },
        child: const Icon(Icons.qr_code_scanner),
      );
    } else {
      return BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
          builder: (context, state) {
        return FloatingActionButton(
          // onPressed: () => widget.onChangedButton(index),
          onPressed: () => BlocProvider.of<DegisenEkranlarCubit>(context)
              .onChangedButton(index),
          child: const Icon(Icons.exit_to_app),
        );
      });
    }
  }
}

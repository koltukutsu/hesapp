// necessary
import 'package:flutter/material.dart';
import 'package:hesap/util/constants.dart';

class HesapFloatingActionButton extends StatefulWidget {
  const HesapFloatingActionButton({Key? key, required this.index})
      : super(key: key);
  final int index;

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
    // if (index == 1) {
    //   return FloatingActionButton(
    //     onPressed: () {
    //       // showDialog(
    //       //   context: context,
    //       //   builder: (BuildContext context) => AlertDialog(
    //       //     title: const Text("Yeni Restorana Geçme"),
    //       //     content: const Text("Yeni Restorana Geçmek İstiyor musun?"),
    //       //     actions: [
    //       //       TextButton(
    //       //         child: const Text("Hayır"),
    //       //         onPressed: () {
    //       //           // context.read<ProfileCubit>().toggleEditMode();
    //       //           Navigator.of(context).pop();
    //       //           ScaffoldMessenger.of(context).showSnackBar(
    //       //               informationSnackbar("Restorandan Çıkılmadı"));
    //       //           // buraya eski hallerine getirilmesi icin bir ozellik eklenmesi lazim, ufak bir fonksiyon ile halledilir
    //       //           // TODO: ozelligi eklemeye gerek kalmadi, otomatik olarak halledildi
    //       //         },
    //       //       ),
    //       //       TextButton(
    //       //         child: const Text("Geç"),
    //       //         onPressed: () {
    //       //           Navigator.of(context).pop();
    //       //           ScaffoldMessenger.of(context)
    //       //               .showSnackBar(correctSnackbar("Restorandan Çıkıldı"));
    //       //           Navigator.of(context).popUntil(ModalRoute.withName(
    //       //               ROUTE_RESTAURANTS)); // TODO: qr okuma floating action butonuna tiklayinca ilk restoranlar sayfasina yonlendirsin mi??
    //       //           Navigator.of(context).pushNamed(ROUTE_QR_SCREEN);
    //       //         },
    //       //       )
    //       //     ],
    //       //   ),
    //       // );
    //     },
    //     child: const Icon(Icons.qr_code_scanner),
    //   );
    // } else {
    //   return BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
    //       builder: (context, state) {
    //     return FloatingActionButton(
    //       // onPressed: () => widget.onChangedButton(index),
    //       onPressed: () => BlocProvider.of<DegisenEkranlarCubit>(context)
    //           .onChangedButton(index),
    //       child: const Icon(Icons.exit_to_app),
    //     );
    //   }
    //
    //   );
    // }
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(ROUTE_SEPET_EKRAN);
      },
      child: const Icon(Icons.shopping_basket),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/ui/widgets/hesap_information_snack_bar.dart';

class HesapEditingAlertDialog extends StatelessWidget {
  const HesapEditingAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
            title: const Text("Bilgi Değiştirme"),
            content: const Text(
                "Bilgilerini Değiştirmek İstiyor musun?"),
            actions: [
              TextButton(
                child: const Text("Hayır"),
                onPressed: () {
                  // context.read<ProfileCubit>().toggleEditMode();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(informationSnackbar("Profil Bilgileri Değiştirilmedi"));
                  // buraya eski hallerine getirilmesi icin bir ozellik eklenmesi lazim, ufak bir fonksiyon ile halledilir
                  // TODO: ozelligi eklemeye gerek kalmadi, otomatik olarak halledildi
                },
              ),
              TextButton(
                child: const Text("Evet"),
                onPressed: () {
                  context.read<ProfileCubit>().toggleEditMode();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
    // return showDialog(
    //   context: context,
    //   builder: (BuildContext context) => AlertDialog(
    //     title: const Text("Bilgi Değiştirme"),
    //     content: const Text(
    //         "Bilgilerini Değiştirmek İstiyor musun?"),
    //     actions: [
    //       TextButton(
    //         child: const Text("Hayır"),
    //         onPressed: () {
    //           // context.read<ProfileCubit>().toggleEditMode();
    //           Navigator.of(context).pop();
    //           ScaffoldMessenger.of(context)
    //               .showSnackBar(informationSnackbar("Profil Bilgileri Değiştirilmedi"));
    //           // buraya eski hallerine getirilmesi icin bir ozellik eklenmesi lazim, ufak bir fonksiyon ile halledilir
    //           // TODO: ozelligi eklemeye gerek kalmadi, otomatik olarak halledildi
    //         },
    //       ),
    //       TextButton(
    //         child: const Text("Evet"),
    //         onPressed: () {
    //           context.read<ProfileCubit>().toggleEditMode();
    //           Navigator.of(context).pop();
    //         },
    //       )
    //     ],
    //   ),
    // );
  }
}

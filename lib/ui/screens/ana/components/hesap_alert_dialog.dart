import 'package:flutter/material.dart';

class HesapAlertDialog extends StatelessWidget {
  const HesapAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      AlertDialog(
        title: const Text("Bilgi Değiştirme"),
        content: const Text("Bilgilerini Değiştirmek İstiyor musun?"),
        actions: [
          TextButton(
            child: const Text("Hayır"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Event"),
            onPressed: () {
              // context.read<ProfileCubit>().toggleEditMode();
              Navigator.of(context).pop();
            },
          )
        ],
      );
  }
}

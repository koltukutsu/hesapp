import 'package:flutter/material.dart';

class UyeOlDogrulamaPencere extends StatelessWidget {
  const UyeOlDogrulamaPencere({
    Key? key,
    required this.email,
    required this.confirm,
  }) : super(key: key);

  final String email;
  final VoidCallback confirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("E-postanızı doğrulayın"),
      content: Text("Doğrulama linki $email adresine gönderildi."),
      actions: [
        TextButton(
          child: const Text('TAMAM'),
          onPressed: confirm,
        ),
      ],
    );
  }
}

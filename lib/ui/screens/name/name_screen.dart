import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/ui/widgets/hesap_button.dart';
import 'package:hesap/ui/widgets/hesap_text_field.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = "";

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text("Masadakiler seni hangi isimle tanısın?"),
              Expanded(
                child: HesapTextField(
                  label: "Kullanıcı Adı",
                  onChanged: (value) {
                    username = value;
                  },
                ),
              ),
              HesapButton(
                label: "Devam Et",
                onPressed: () {
                  Navigator.pop(context);
                  context.read<AuthCubit>().signInAnonymously(username);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

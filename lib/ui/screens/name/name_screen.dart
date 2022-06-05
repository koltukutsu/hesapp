import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/ui/widgets/hesap_button_animated.dart';
import 'package:hesap/ui/widgets/hesap_text_field.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  String username = "";

  @override
  Widget build(BuildContext context) {
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
                    setState(() {
                      username = value;
                    });
                    // print(username);
                  },
                ),
              ),
              HesapButtonAnimated(
                label: "Devam Et",
                filled: true,
                enabled: username.isNotEmpty ? true : false,
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

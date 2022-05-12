import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/ui/screens/ana/ana_ekran.dart';
import 'package:hesap/ui/screens/giris_yap/giris_yap_screen.dart';

import '../../../cubit/auth/auth_cubit.dart';

class AcilisEkran extends StatefulWidget {
  const AcilisEkran({Key? key}) : super(key: key);

  @override
  State<AcilisEkran> createState() => _AcilisEkranState();
}

class _AcilisEkranState extends State<AcilisEkran> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: İnternet kontrolü yapılacak.
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AuthAnonymous) {
          return const GirisYapEkran();
        } else if (state is AuthLoggedIn) {
          return const AnaEkran();
        } else {
          return Container();
        }
      },
    );
  }
}

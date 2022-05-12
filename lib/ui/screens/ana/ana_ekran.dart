import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/ui/screens/ana/components/ana_ekran_body.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key, this.hesapUser}) : super(key: key);

  final HesapUser? hesapUser;

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state.hesapUser;
        return AnaEkranBody(
          hesapUser: user,
        );
      },
    );
  }
}

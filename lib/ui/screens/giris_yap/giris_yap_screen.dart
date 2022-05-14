import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/util/constants.dart';
import '../../../cubit/auth/auth_cubit.dart';
import 'components/giris_yap_app_bar.dart';
import 'components/giris_yap_body.dart';

class GirisYapEkran extends StatefulWidget {
  const GirisYapEkran({Key? key}) : super(key: key);

  @override
  State<GirisYapEkran> createState() => _GirisYapEkranState();
}

class _GirisYapEkranState extends State<GirisYapEkran> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignInSuccessful) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: const GirisYapAppBar(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: GirisYapBody(
          setEmail: (value) {
            email = value;
          },
          setPassword: (value) {
            password = value;
          },
          navigateToSignUpScreen: () {
            Navigator.pushNamed(context, ROUTE_SIGN_UP);
          },
          signIn: () {
            context.read<AuthCubit>().signIn(
                  email.trim(),
                  password.trim(),
                );
          },
          signInAnonymously: () {
            context.read<AuthCubit>().signInAnonymously();
          },
        ),
      ),
    );
  }
}

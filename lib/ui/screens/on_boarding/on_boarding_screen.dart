import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/ui/screens/giris_yap/giris_yap_screen.dart';
import 'package:hesap/ui/screens/name/name_screen.dart';
import 'package:hesap/ui/screens/uye_ol/uye_ol_ekran.dart';
import 'package:hesap/ui/widgets/hesap_correct_snack_bar.dart';
import 'package:hesap/util/animated_route.dart';
import 'package:hesap/util/constants.dart';
import 'components/on_boarding_app_bar.dart';
import 'components/on_boarding_body.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnBoardingAppBar(),
      body: OnBoardingBody(
        navigateToRegisterScreen: () {
          FadeInRoute(
              page: const UyeOlEkran(),
              routeName: ROUTE_REGISTER);
          // Navigator.pushNamed(context, ROUTE_REGISTER);
        },
        navigateToLoginScreen: () {
          FadeInRoute(
              page: const GirisYapEkran(),
              routeName: ROUTE_LOGIN);
          // Navigator.pushNamed(context, ROUTE_LOGIN);
        },
        signInAnonymously: () {
          FadeInRoute(
              page: const NameScreen(),
              routeName: ROUTE_NAME);
          // Navigator.pushNamed(context, ROUTE_NAME);
        },
      ),
    );
  }
}

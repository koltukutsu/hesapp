import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/ui/widgets/hesap_correct_snack_bar.dart';
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
          Navigator.pushNamed(context, ROUTE_REGISTER);
        },
        navigateToLoginScreen: () {
          Navigator.pushNamed(context, ROUTE_LOGIN);
        },
        signInAnonymously: () {
          context.read<AuthCubit>().signInAnonymously();
        },
      ),
    );
  }
}

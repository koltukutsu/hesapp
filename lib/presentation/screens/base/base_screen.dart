import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/logic/internet_baglantisi/internet_cubit.dart';
import 'package:hesap/presentation/screens/ana/ana_ekran.dart';
import 'package:hesap/presentation/screens/odeme/payment_screen.dart';
import 'package:hesap/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:hesap/presentation/screens/restoranlar/restoranlar_screen.dart';
import 'package:hesap/presentation/widgets/hesap_error_snack_bar.dart';
import 'package:hesap/logic/auth/auth_cubit.dart';
import 'components/loading_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              errorSnackbar(state.errorMessage),
            );
        }
      },
      builder: (context, state) {
        if (state is AuthSignInSuccessful) {
          return const RestoranEkran();
        } else if (state is AuthNotSignedIn || state is AuthSignUpSuccessful) {
          return const OnBoardingScreen();
        }
        return const LoadingScreen();
      },
    );
  }
}

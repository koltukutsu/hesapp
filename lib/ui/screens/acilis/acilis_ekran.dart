import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/ui/screens/acilis/components/loading_screen.dart';
import 'package:hesap/ui/screens/qr_scanner/qr_scanner_screen.dart';
import 'package:hesap/ui/widgets/hesap_error_snack_bar.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/util/constants.dart';

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
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              errorSnackbar(state.errorMessage),
            );
        } else if (state is AuthNotSignedIn) {
          Navigator.pushNamed(context, ROUTE_SIGN_IN);
        }
      },
      builder: (context, state) {
        if (state is AuthSignInSuccessful) {
          return const QRScannerScreen();
        }
        return const LoadingScreen();
      },
    );
  }
}

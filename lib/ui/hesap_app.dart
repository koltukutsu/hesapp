import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';
import 'package:hesap/cubit/theme/theme_cubit.dart';
import 'package:hesap/data/repository/auth_repository.dart';
import 'package:hesap/ui/screens/base/base_screen.dart';
import 'package:hesap/ui/screens/giris_yap/giris_yap_screen.dart';
import 'package:hesap/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:hesap/ui/screens/qr_scanner/qr_scanner_screen.dart';
import 'package:hesap/ui/screens/uye_ol/uye_ol_ekran.dart';
import 'package:hesap/util/constants.dart';

class HesapApp extends StatelessWidget {
  const HesapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (authContext) => AuthCubit(AuthRepository()),
        ),
        BlocProvider(
          create: (qrContext) => QRCubit(),
        ),
        BlocProvider(
          create: (themeContext) => ThemeCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            title: 'Hesap',
            debugShowCheckedModeBanner: false,
            theme: theme,
            themeMode: ThemeMode.system,
            initialRoute: ROUTE_BASE,
            routes: {
              ROUTE_BASE: (context) => const BaseScreen(),
              ROUTE_ON_BOARDING: (context) => const OnBoardingScreen(),
              ROUTE_LOGIN: (context) => const GirisYapEkran(),
              ROUTE_REGISTER: (context) => const UyeOlEkran(),
              ROUTE_QR_SCANNER: (context) => const QRScannerScreen(),
            },
          );
        },
      ),
    );
  }
}

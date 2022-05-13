import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/data/repository/auth/auth_repository_impl.dart';
import 'package:hesap/ui/screens/acilis/acilis_ekran.dart';
import 'package:hesap/ui/screens/ana/ana_ekran.dart';
import 'package:hesap/ui/screens/giris_yap/giris_yap_screen.dart';
import 'package:hesap/ui/screens/restoranlar/restoranlar_screen.dart';
import 'package:hesap/ui/screens/uye_ol/uye_ol_ekran.dart';
import 'package:hesap/ui/theme/themes.dart';
import 'package:hesap/util/constants.dart';

import '../util/theme_manager.dart';

ThemeManager _themeManager = ThemeManager();

class HesapApp extends StatelessWidget {
  const HesapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            AuthRepositoryImpl(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Hesap',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeManager.themeMode,
        initialRoute: ROUTE_BASE,
        routes: {
          ROUTE_BASE: (context) => const AcilisEkran(),
          ROUTE_MAIN: (context) => const AnaEkran(),
          ROUTE_SIGN_IN: (context) => const GirisYapEkran(),
          ROUTE_SIGN_UP: (context) => const UyeOlEkran(),
          ROUTE_RESTAURANTS: (context) => const RestaurantEkran(),
        },
      ),
    );
  }
}

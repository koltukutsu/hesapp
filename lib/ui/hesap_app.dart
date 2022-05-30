import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/cubit/konum/konum_cubit.dart';
import 'package:hesap/cubit/menu_arama/menu_arama_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/cubit/restoran/restoran_cubit.dart';
import 'package:hesap/cubit/theme/theme_cubit.dart';
import 'package:hesap/data/repository/auth_repository.dart';
import 'package:hesap/data/repository/konum/konum_repository.dart';
import 'package:hesap/data/repository/restoran/restoran_repository.dart';

import 'package:hesap/ui/screens/base/base_screen.dart';
import 'package:hesap/ui/screens/ana/ana_ekran.dart';

// import 'package:hesap/ui/screens/ana/ana_ekran_semih.dart';
import 'package:hesap/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:hesap/ui/screens/giris_yap/giris_yap_screen.dart';
import 'package:hesap/ui/screens/pop_up/pop_ekran.dart';
import 'package:hesap/ui/screens/qr_code/qr_okuma_ekran.dart';
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
            AuthRepository(),
          ),
        ),

        // BlocProvider(
        //   create: (context) => QRCubit(),
        // ),
        BlocProvider(
          // Ana Sayfa, Degisen Ekranlar
          create: (context) => DegisenEkranlarCubit(),
        ),
        BlocProvider(
          create: (context) => RestoranCubit(
            RestoranRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => KonumCubit(
            KonumRepository(),
          ),
        ),
        BlocProvider(create: (context) => MenuAramaCubit()),
        BlocProvider(create: (context) => ProfileCubit())
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Hesap',
            debugShowCheckedModeBanner: false,
            theme: theme,
            themeMode: ThemeMode.system,
            initialRoute: ROUTE_BASE,
            routes: {
              ROUTE_BASE: (context) => const BaseScreen(),
              ROUTE_ON_BOARDING: (context) => const OnBoardingScreen(),
              ROUTE_MAIN: (context) => const AnaEkran(),
              ROUTE_LOGIN: (context) => const GirisYapEkran(),
              ROUTE_REGISTER: (context) => const UyeOlEkran(),
              ROUTE_RESTAURANTS: (context) => const RestoranEkran(),
              ROUTE_QR_SCREEN: (context) => const QrOkumaEkran(),
              // ROUTE_POP_EKRAN: (context) => const PopUpEkran(text: text)
              // ROUTE_QR_SCREEN: (context) => const QRScannerScreen(),
            },
          );
        },
      ),
    );
  }
}

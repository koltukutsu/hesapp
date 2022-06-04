import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/card/card_cubit.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/cubit/internet_baglantisi/internet_cubit.dart';
import 'package:hesap/cubit/konum/konum_cubit.dart';
import 'package:hesap/cubit/masa/masa_cubit.dart';
import 'package:hesap/cubit/menu/menu_cubit.dart';
import 'package:hesap/cubit/menu_arama/menu_arama_cubit.dart';
import 'package:hesap/cubit/order/order_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/cubit/qr/qr_cubit.dart';
import 'package:hesap/cubit/restoran/restoran_cubit.dart';
import 'package:hesap/cubit/sepet/sepet_cubit.dart';
import 'package:hesap/cubit/theme/theme_cubit.dart';
import 'package:hesap/data/repository/auth_repository.dart';
import 'package:hesap/data/repository/card_repository.dart';
import 'package:hesap/data/repository/konum/konum_repository.dart';
import 'package:hesap/data/repository/menu_repository.dart';
import 'package:hesap/data/repository/order_history_repository.dart';
import 'package:hesap/data/repository/profile_repository.dart';
import 'package:hesap/data/repository/table_repository.dart';
import 'package:hesap/data/repository/restoran/restoran_repository.dart';
import 'package:hesap/ui/screens/base/base_screen.dart';
import 'package:hesap/ui/screens/ana/ana_ekran.dart';
import 'package:hesap/ui/screens/internet/internet_screen.dart';
import 'package:hesap/ui/screens/odeme/payment_screen.dart';
import 'package:hesap/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:hesap/ui/screens/giris_yap/giris_yap_screen.dart';
import 'package:hesap/ui/screens/profile/components/profile_card_add.dart';
import 'package:hesap/ui/screens/profile/profile_screen.dart';
import 'package:hesap/ui/screens/qr_scanner/qr_scanner_screen.dart';
import 'package:hesap/ui/screens/restoranlar/restoranlar_screen.dart';
import 'package:hesap/ui/screens/sepet/order_screen.dart';
import 'package:hesap/ui/screens/uye_ol/uye_ol_ekran.dart';
import 'package:hesap/util/constants.dart';

class HesapApp extends StatelessWidget {
  const HesapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(AuthRepository())),
        BlocProvider(create: (context) => DegisenEkranlarCubit()),
        BlocProvider(create: (context) => RestoranCubit(RestoranRepository())),
        BlocProvider(create: (context) => KonumCubit(KonumRepository())),
        BlocProvider(create: (context) => MenuAramaCubit()),
        BlocProvider(
            create: (context) =>
                ProfileCubit(ProfileRepository(), AuthRepository())),
        BlocProvider(create: (context) => InternetCubit()),
        BlocProvider(create: (context) => CardCubit(CardRepository())),
        BlocProvider(create: (context) => OrderCubit(OrderHistoryRepository())),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => MenuCubit(MenuRepository())),
        BlocProvider(
          create: (context) => QRCubit(TableRepository(), AuthRepository()),
        ),
        BlocProvider(
          create: (context) => SepetCubit(),
        ),
        BlocProvider(
          create: (context) => MasaCubit(TableRepository()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Hesap',
            debugShowCheckedModeBanner: false,
            theme: theme,
            themeMode: ThemeMode.system,
            initialRoute: ROUTE_INTERNET_CONTROL,
            routes: {
              ROUTE_BASE: (context) => const BaseScreen(),
              ROUTE_ON_BOARDING: (context) => const OnBoardingScreen(),
              ROUTE_MAIN: (context) => const AnaEkran(),
              ROUTE_LOGIN: (context) => const GirisYapEkran(),
              ROUTE_REGISTER: (context) => const UyeOlEkran(),
              ROUTE_RESTAURANTS: (context) => const RestoranEkran(),
              ROUTE_SEPET_EKRAN: (context) => OrderScreen(),
              ROUTE_PAYMENT: (context) => const PaymentScreen(),
              ROUTE_QR_SCREEN: (context) => const QRScannerScreen(),
              ROUTE_PROFIL_EKRAN: (context) => const ProfileScreen(),
              ROUTE_INTERNET_CONTROL: (context) => const InternetScreen(),
              ROUTE_CREDIT_CARD_ADD: (context) => HesapAddCreditCard(),
            },
          );
        },
      ),
    );
  }
}

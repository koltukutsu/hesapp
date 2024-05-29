import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/logic/auth/auth_cubit.dart';
import 'package:hesap/logic/card/card_cubit.dart';
import 'package:hesap/logic/degisen_ekranlar/degisen_ekranlar_cubit.dart';
import 'package:hesap/logic/internet_baglantisi/internet_cubit.dart';
import 'package:hesap/logic/konum/konum_cubit.dart';
import 'package:hesap/logic/masa/masa_cubit.dart';
import 'package:hesap/logic/menu/menu_cubit.dart';
import 'package:hesap/logic/menu_arama/menu_arama_cubit.dart';
import 'package:hesap/logic/order/order_cubit.dart';
import 'package:hesap/logic/profile/profile_cubit.dart';
import 'package:hesap/logic/qr/qr_cubit.dart';
import 'package:hesap/logic/restoran/restoran_cubit.dart';
import 'package:hesap/logic/sepet/sepet_cubit.dart';
import 'package:hesap/logic/theme/theme_cubit.dart';
import 'package:hesap/data/repository/auth_repository.dart';
import 'package:hesap/data/repository/card_repository.dart';
import 'package:hesap/data/repository/konum/konum_repository.dart';
import 'package:hesap/data/repository/menu_repository.dart';
import 'package:hesap/data/repository/order_history_repository.dart';
import 'package:hesap/data/repository/profile_repository.dart';
import 'package:hesap/data/repository/table_repository.dart';
import 'package:hesap/data/repository/restoran/restoran_repository.dart';
import 'package:hesap/presentation/screens/animated_splash_screen/animated_splash_screen.dart';
import 'package:hesap/presentation/screens/base/base_screen.dart';
import 'package:hesap/presentation/screens/ana/ana_ekran.dart';
import 'package:hesap/presentation/screens/internet/internet_screen.dart';
import 'package:hesap/presentation/screens/name/name_screen.dart';
import 'package:hesap/presentation/screens/odeme/payment_screen.dart';
import 'package:hesap/presentation/screens/on_boarding/components/hesap_aydinlatma_metni.dart';
import 'package:hesap/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:hesap/presentation/screens/giris_yap/giris_yap_screen.dart';
import 'package:hesap/presentation/screens/pop_up/pop_ekran.dart';
import 'package:hesap/presentation/screens/profile/components/profile_card_add.dart';
import 'package:hesap/presentation/screens/profile/profile_screen.dart';
import 'package:hesap/presentation/screens/qr_scanner/qr_scanner_screen.dart';
import 'package:hesap/presentation/screens/restoranlar/restoranlar_screen.dart';
import 'package:hesap/presentation/screens/sepet/order_screen.dart';
import 'package:hesap/presentation/screens/uye_ol/uye_ol_ekran.dart';
import 'package:hesap/util/constants.dart';
import 'package:sizer/sizer.dart';

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
          create: (context) => MasaCubit(TableRepository(), AuthRepository()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return Sizer(
            builder:(context, orientation, deviceType) => MaterialApp(
              title: 'Hesap',
              debugShowCheckedModeBanner: false,
              theme: theme,
              themeMode: ThemeMode.system,
              initialRoute: ROUTE_ANIMATED_SPLASH_SCREEN,
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
                ROUTE_CREDIT_CARD_ADD: (context) => const HesapAddCreditCard(),
                ROUTE_ANIMATED_SPLASH_SCREEN: (context) =>
                    const HesapAnimatedSplashScreen(),
                ROUTE_AYINLATMA_METNI: (context) => const HesapAydinlatmaMetni(),
                ROUTE_NAME: (context) => const NameScreen(),
                ROUTE_POP_EKRAN: (context) => const PopUpEkran(),
              },
            ),
          );
        },
      ),
    );
  }
}

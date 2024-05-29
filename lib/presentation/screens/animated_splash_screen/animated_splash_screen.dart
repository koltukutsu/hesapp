import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/logic/konum/konum_cubit.dart';
import 'package:hesap/logic/restoran/restoran_cubit.dart';
import 'package:hesap/presentation/screens/internet/internet_screen.dart';
import 'package:hesap/presentation/theme/colors.dart';
import 'package:hesap/presentation/widgets/hesap_normal_text.dart';

class HesapAnimatedSplashScreen extends StatefulWidget {
  const HesapAnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  State<HesapAnimatedSplashScreen> createState() =>
      _HesapAnimatedSplashScreenState();
}

class _HesapAnimatedSplashScreenState extends State<HesapAnimatedSplashScreen> {
  @override
  initState() {
    super.initState();
    // context.read<RestoranCubit>().initialize();
    // context.read<KonumCubit>().getLocation();
    context.read<KonumCubit>().checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: const Center(
        child: HesapNormalText(
            text: "hesap", fontSize: 60, textColor: AppColors.white),
        // child: Transform.scale(
        //     scale: 10,
        //     child: const Icon(
        //       Icons.ac_unit,
        //       color: AppColors.white,
        //     ))
      ),
      // TODO: splash ekrani ozel animasyon yada resim
      nextScreen: const InternetScreen(),
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.scale,
      backgroundColor: AppColors.primary,
    );
  }
}

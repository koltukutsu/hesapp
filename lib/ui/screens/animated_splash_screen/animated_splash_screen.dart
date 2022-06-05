import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/konum/konum_cubit.dart';
import 'package:hesap/cubit/restoran/restoran_cubit.dart';
import 'package:hesap/ui/screens/internet/internet_screen.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';

enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
}

class HesapAnimatedSplashScreen extends StatefulWidget {
  const HesapAnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  State<HesapAnimatedSplashScreen> createState() => _HesapAnimatedSplashScreenState();
}

class _HesapAnimatedSplashScreenState extends State<HesapAnimatedSplashScreen> {
  //
  // @override
  // initState(){
  //   super.initState();
  //   context.read<RestoranCubit>().initialize();
  //   context.read<KonumCubit>().getLocation();
  //   context.read<KonumCubit>().checkPermission();
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: const HesapNormalText(
          text: "Hesap",
        ),
        nextScreen: const InternetScreen(),
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        backgroundColor: AppColors.primary);
  }
}

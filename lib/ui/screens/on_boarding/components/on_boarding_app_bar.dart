import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hesap/ui/theme/colors.dart';

class OnBoardingAppBar extends StatelessWidget with PreferredSizeWidget {
  const OnBoardingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: const Text(
        "hesap",
        style: TextStyle(
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
          fontSize: 40.0,
          letterSpacing: -2,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

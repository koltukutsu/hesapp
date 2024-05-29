import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hesap/presentation/theme/colors.dart';

class SepetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SepetAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        // statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      foregroundColor: AppColors.primary,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: const Text(""),
      titleTextStyle: const TextStyle(
        fontFamily: 'Ubuntu',
        fontSize: 16.0,
        color: AppColors.gray,
        height: 1.6,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

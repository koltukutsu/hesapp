import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../theme/colors.dart';

class UyeOlAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UyeOlAppBar({Key? key, required this.onBack}) : super(key: key);

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.gray,
        title: const Text("Üye Ol"),
        titleTextStyle: const TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 16.0,
          color: AppColors.gray,
          height: 1.6,
        ),
        centerTitle: true,
        elevation: 0);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

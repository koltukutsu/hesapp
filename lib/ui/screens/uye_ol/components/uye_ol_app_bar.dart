import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hesap/util/constants.dart';
import '../../../theme/colors.dart';

class UyeOlAppBar extends StatelessWidget with PreferredSizeWidget {
  const UyeOlAppBar({Key? key, required this.onClosed}) : super(key: key);

  final VoidCallback onClosed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: const Text("Üye Ol"),
        titleTextStyle: const TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 20.0,
          color: AppColors.gray,
          height: 1.6,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: AppColors.gray,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, ROUTE_SIGN_IN);
          },
        ),
        elevation: 0);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

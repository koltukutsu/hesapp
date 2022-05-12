import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GirisYapAppBar extends StatelessWidget with PreferredSizeWidget {
  const GirisYapAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

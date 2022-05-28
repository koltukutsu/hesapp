// necessary
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/util/constants.dart';

class QrOkumaEkran extends StatefulWidget {
  const QrOkumaEkran({Key? key}) : super(key: key);

  @override
  State<QrOkumaEkran> createState() => _QrOkumaEkran();
}

class _QrOkumaEkran extends State<QrOkumaEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: AppColors.primary,
        elevation: 1,
      ),
      body: Container(
          child: Center(
        child: Column(
          children: [IconButton(
            icon: const Icon(Icons.arrow_right),
            onPressed: () {
            Navigator.of(context).pushNamed(ROUTE_MAIN);
          })],
        ),
      )),
    );
  }
}

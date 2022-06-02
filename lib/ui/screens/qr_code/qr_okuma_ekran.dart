// necessary
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hesap/ui/screens/pop_up/pop_ekran.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';
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
          children: [
            const HesapNormalText(
                text: "QR Okuma Ekrani",
                textColor: AppColors.magenta,
                fontSize: Insets.x3l,
                fontWeight: FontWeight.w700),
            IconButton(
                icon: Transform.scale(
                    scale: 3, child: const Icon(Icons.arrow_right)),
                onPressed: () {
                  // Navigator.of(context).pushNamed(ROUTE_POP_EKRAN);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PopUpEkran(text: "Flutter Kafe")));
                })
          ],
        ),
      )),
    );
  }
}

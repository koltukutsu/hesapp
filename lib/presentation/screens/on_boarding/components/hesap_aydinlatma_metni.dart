import 'package:flutter/material.dart';
import 'package:hesap/presentation/theme/colors.dart';
import 'package:hesap/presentation/widgets/hesap_normal_text.dart';
import 'package:hesap/util/constants.dart';

class HesapAydinlatmaMetni extends StatelessWidget {
  const HesapAydinlatmaMetni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aydınlatma Metni"),
      ),
      // TODO: aydinlatma metni hazirlanacak
      body: SingleChildScrollView(
        child: SizedBox(
            child: RichText(
          text: const TextSpan(
            text: AYDINLATMA_METNI,
            style: TextStyle(color: AppColors.darkBackground, fontSize: 10),
          ),
        )
            // child: HesapNormalText(
            //   text: "aydinlatma metni",
            // ),
            ),
      ),
    );
  }
}

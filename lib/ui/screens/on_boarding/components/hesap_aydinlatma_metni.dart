import 'package:flutter/material.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';

class HesapAydinlatmaMetni extends StatelessWidget {
  const HesapAydinlatmaMetni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aydınlatma Metni"),
      ),
      // TODO: aydinlatma metni hazirlanacak
      body: const SizedBox(
        child: HesapNormalText(
          text: "aydinlatma metni",
        ),
      ),
    );
  }
}

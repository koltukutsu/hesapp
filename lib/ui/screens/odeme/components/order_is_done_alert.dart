import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';

class OrderDoneAlertDialog extends StatelessWidget {
  const OrderDoneAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ödeme Yapıldı"),
      content: Center(
          child: Column(
        children: [
          Transform.scale(scale: 3, child: const Icon(Icons.check_circle, color: AppColors.primary)),
          const HesapNormalText(text: "Ödemeniz başarıyla", fontSize: 28),
          const HesapNormalText(text: "tamamlandı", fontSize: 28),
          const SizedBox(height: 31),
          Row(
            children: const [
              HesapNormalText(text: "Siparişiniz hazırlanıyor  ", fontSize: 20),
              Icon(Icons.timer_rounded)
            ],
          )
        ],
      )),
      // actions: [
      //
      // ],
    );
  }
}
// :TODO asagidaki mantik kullanilacak
// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     _timer = Timer(Duration(seconds: 5), () {
// Navigator.of(context).pop();
// });
// return OrderDoneAlertDialog().then((value) {
//   if(_timer.isActive) {
//     _timer.cancel();
// }
// })
// }
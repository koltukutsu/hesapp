import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';

class OrderDoneAlertDialog extends StatelessWidget {
  const OrderDoneAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ödeme Tamamlandı"),
      content: Row(
        children: [
          Transform.scale(
              scale: 2,
              child: const Icon(
                Icons.check_circle,
                color: AppColors.primary,
              )),
          const SizedBox(width: 25,),
          const Text("Ödemeniz Başarıyla Tamamlandı")
        ],
      ),
      // actions: [
      //   TextButton(
      //     child: const Text("Hayır"),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   TextButton(
      //     child: const Text("Event"),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   )
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

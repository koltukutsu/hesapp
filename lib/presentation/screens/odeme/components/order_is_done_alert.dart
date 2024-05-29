import 'package:flutter/material.dart';
import 'package:hesap/presentation/theme/colors.dart';
import 'package:hesap/presentation/widgets/hesap_normal_text.dart';

class OrderDoneAlertDialog extends StatelessWidget {
  const OrderDoneAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Transform.scale(
            scale: 3,
            child: const Icon(Icons.check_circle, color: AppColors.primary)),
          Text("Ödeme Yapıldı"),
        ],
      ),
      // content: Transform.scale(
      //     scale: 3,
      //     child: const Icon(Icons.check_circle, color: AppColors.primary)),

      actions: [
        Center(
          child: TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Tamam'),
          ),
        ),
      ],
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

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hesap/cubit/qr/qr_cubit.dart';
// import 'package:hesap/ui/screens/qr_scanner/components/qr_scanner_view.dart';
// import 'package:hesap/ui/theme/colors.dart';
//
// class QRScannerBody extends StatelessWidget {
//   const QRScannerBody({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             QRScanner(
//               onQRViewCreated: (controller) {
//                 context.read<QRCubit>().scan(controller);
//               },
//             ),
//             Wrap(
//               direction: Axis.horizontal,
//               children: [
//                 Container(
//                   clipBehavior: Clip.hardEdge,
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(16.0),
//                         bottomRight: Radius.circular(16.0)),
//                     color: AppColors.primary,
//                   ),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       const Text(
//                         "Masadaki QR kodu okutun",
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.white,
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Image.asset(
//                           "assets/images/qr.png",
//                           width: 96,
//                           height: 96.0,
//                           color: AppColors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/logic/internet_baglantisi/internet_cubit.dart';
import 'package:hesap/presentation/screens/base/base_screen.dart';
import 'package:hesap/presentation/theme/colors.dart';
import 'package:hesap/presentation/widgets/hesap_correct_snack_bar.dart';
import 'package:hesap/presentation/widgets/hesap_error_snack_bar.dart';
// import 'package:hesap/ui/widgets/hesap_information_snack_bar.dart';
import 'package:hesap/presentation/widgets/hesap_normal_text.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state.isOnline) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              correctSnackbar("İnternete Bağlanıldı"),
            );
        } else if (state.isOnline == false) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              errorSnackbar("İnternete Bağlanılmadı"),
            );
        }
      },
      builder: (context, state) {
        if (state.isOnline) {
          return const BaseScreen();
        } else {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 8,
                  child: const Icon(Icons.report_problem,
                      color: AppColors.magenta),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 70.0),
                  child: SizedBox(
                      child: HesapNormalText(text: "İnternete bağlanılamadı")),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: SizedBox(
                      child:
                          HesapNormalText(text: "Bağlantınızı kontrol edin")),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

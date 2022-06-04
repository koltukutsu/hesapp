import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/internet_baglantisi/internet_cubit.dart';
import 'package:hesap/ui/widgets/hesap_correct_snack_bar.dart';
import 'package:hesap/ui/widgets/hesap_error_snack_bar.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';
import 'package:hesap/util/constants.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        child: const HesapNormalText(
          text: "Internet Baglantisi yok",
        ),
      )),
    );
    return BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
      if (true) {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            correctSnackbar("Internet Var"),
          );
      }
    }, builder: (context, state) {
      if (state is InternetConnected) {
        return Scaffold(
          body: Center(
              child: Container(
            child: const HesapNormalText(text: "İnternete baglandiniz"),
          )),
        );
      } else if (state is InternetNotConnected) {
        return Scaffold(
          body: Center(
              child: Container(
            child: const HesapNormalText(text: "İnternete bağlanın lütfen"),
          )),
        );
      }
    });
  }
}

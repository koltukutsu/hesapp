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
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              correctSnackbar("Internet Var"),
            );
        } else {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(errorSnackbar("Internet Baglantiniz yok!!!"));
        }
      },
      builder: (state, context_) {
        if (state is InternetConnected) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(ROUTE_BASE);
        } else {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(ROUTE_BASE);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

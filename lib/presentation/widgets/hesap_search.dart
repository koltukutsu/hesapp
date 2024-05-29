import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/logic/menu_arama/menu_arama_cubit.dart';
import 'package:hesap/presentation/screens/menu/components/hesap_text_field_with_suffix.dart';
import 'package:hesap/presentation/theme/colors.dart';

class HesapSearch extends StatelessWidget {
  HesapSearch({Key? key}) : super(key: key);

  final inputController = TextEditingController();
  // String search = "";
  // final String inputString;
  // final inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 0,
                  blurRadius: 50,
                  offset: const Offset(0, 48), // changes position of shadow
                ),
              ],
            ),
            child: BlocBuilder<MenuAramaCubit, MenuAramaState>(
              builder: (context, state) {
                return HesapTextFieldSuffix(
                  hint: "Aramanızı yapın",
                  suffixIcon: const Icon(
                    Icons.search,
                    color: AppColors.darkBackground,
                  ),
                  borderColor: AppColors.darkBackground,
                  onChanged: (value) {
                    BlocProvider.of<MenuAramaCubit>(context)
                        .setInputValue(value);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/menu_arama/menu_arama_cubit.dart';
import 'package:hesap/ui/screens/siparis/components/hesap_text_field_with_suffix.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/widgets/hesap_text_field.dart';
import 'package:hesap/ui/widgets/hesap_text_field_with_controller.dart';

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
            height: 80,
            width: 280,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 0,
                  blurRadius: 50,
                  offset: const Offset(0, 48,), // changes position of shadow
                ),
              ],
            ),
            child: BlocBuilder<MenuAramaCubit, MenuAramaState>(
              builder: (context, state) {
                return HesapTextFieldSuffix(
                  label: "Aramanizi yapin",
                  suffixIcon: const Icon(Icons.search, color: AppColors.darkBackground,),
                  borderColor: AppColors.darkBackground,
                  onChanged: (value) {
                    BlocProvider.of<MenuAramaCubit>(context).setInputValue(value);
                  },
                );
              }
            ),
          ),
          // IconButton(onPressed: null, icon: Icon(Icons.search))
        ],
      ),
    );
  }
}

// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/degisen_ekranlar/degisen_ekranlar_cubit.dart';
// import 'package:flutter/services.dart';
import 'package:hesap/ui/widgets/hesap_button_not_flexible.dart';
import 'package:hesap/ui/screens/pop_up/components/hesap_middle_side2.dart';
// component
import 'package:hesap/ui/screens/common_screen_sections/hesap_up_side.dart';

class PopUpEkran extends StatefulWidget {
  const PopUpEkran({Key? key, required this.text}) : super(key: key);
  final String text;
  // final String secondText;

  @override
  State<PopUpEkran> createState() => _PopUpEkran();
}

class _PopUpEkran extends State<PopUpEkran> {
  void _startingFunction() {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _startingFunction());
  }

  final Map data = {
    "Masa Ismi": "Flutter Kafe",
    "kisiler": [
      {
        "ismi": "Merve",
        "ismarladiklari": [
          "corba",
          "makarna",
        ]
      },
      {
        "ismi": "Zeyney",
        "ismarladiklari": [
          "corba",
          "makarna",
        ]
      },
      {
        "ismi": "Semih",
        "ismarladiklari": [
          "corba",
          "makarna",
        ]
      },
      {
        "ismi": "Erdem",
        "ismarladiklari": [
          "corba",
          "makarna",
        ]
      },
      {
        "ismi": "Emine",
        "ismarladiklari": [
          "corba",
          "makarna",
        ]
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      //   backgroundColor: AppColors.primary,
      //   elevation: 1,
      // ),
      body: BlocBuilder<DegisenEkranlarCubit, DegisenEkranlarState>(
        builder: (context, state) {
          return SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HesapUpSide(
                mekanIsmi: widget.text,
                secondText: "Masa 24",
              ),
              HesapMiddleSide2(data: data),

              SizedBox(
                height: 75,
                width: 300,
                child: HesapButtonNotFlexible(
                  label: 'Masaya Oturun',
                  filled: true,
                  textSize: 24,
                  onPressed: () {
                    // Navigator.of(context).pop();
                    //   Navigator.pop(context, 1);
                      BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(1);
                  },
                ),
              ),
              SizedBox(
                height: 65,
                width: 200,
                child: HesapButtonNotFlexible(
                  label: 'İptal',
                  filled: false,
                  textSize: 24,
                  onPressed: () {
                    // Navigator.of(context).pop(0);
                    BlocProvider.of<DegisenEkranlarCubit>(context).onChangedTab(0);
                  },
                ),
              ),
              // HesapMiddleSide(data: data),
            ],
          ));
        }
      ),
    );
  }
}

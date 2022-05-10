// necessary
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// component
import 'package:hesap/components/screen_sections/hesap_up_side.dart';

// theme
import 'package:hesap/theme/colors.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) => _startingFunction());
  }

  final Map data = {
    "Kafe Ismi": "Flutter Kafe",
    "Kisiler": [
      {
        "ismi": "Corbalar",
        "elemanlar": [
          {
            "ismi": "1. corba",
            "sure": "15",
            "fiyat": "15",
          },
          {
            "ismi": "2. corba",
            "sure": "5",
            "fiyat": "5",
          },
          {
            "ismi": "3. corba",
            "sure": "135",
            "fiyat": "125",
          },
          {
            "ismi": "4. corba",
            "sure": "150",
            "fiyat": "150",
          },
        ]
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: AppColors.primary,
        elevation: 1,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HesapUpSide(
            mekanIsmi: widget.text,
            secondText: "Masa 24",
          ),
          // HesapMiddleSide(data: data),
        ],
      )),
    );
  }
}

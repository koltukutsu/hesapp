import 'package:flutter/material.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/util/constants.dart';

class AnaEkranBody extends StatefulWidget {
  const AnaEkranBody({
    Key? key,
    required this.hesapUser,
  }) : super(key: key);

  final HesapUser? hesapUser;

  @override
  State<AnaEkranBody> createState() => _AnaEkranBodyState();
}

class _AnaEkranBodyState extends State<AnaEkranBody> {
  late bool isAnonymous;

  @override
  void initState() {
    super.initState();
    isAnonymous = widget.hesapUser == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(isAnonymous
                ? "Giriş yapılmadı"
                : "Hoş geldin ${widget.hesapUser!.username}"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ROUTE_SIGN_IN);
              },
              child: const Text("Giriş Yap"),
            )
          ],
        ),
      ),
    );
  }
}

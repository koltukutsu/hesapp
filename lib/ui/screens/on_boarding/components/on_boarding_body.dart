import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/colors.dart';
import '../../../theme/insets.dart';
import '../../../widgets/hesap_button.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({
    Key? key,
    required this.navigateToLoginScreen,
    required this.navigateToRegisterScreen,
    required this.signInAnonymously,
  }) : super(key: key);

  final VoidCallback navigateToLoginScreen;
  final VoidCallback navigateToRegisterScreen;
  final VoidCallback signInAnonymously;

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/qr.png"),
          alignment: Alignment.bottomLeft,
          fit: BoxFit.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.l),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hesap ile sipariş ve ödeme çok kolay!",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SvgPicture.asset('assets/images/on_boarding_1.svg'),
                  const Text(
                    "QR kodu okutarak garsonu beklemeden siparişinizi verebilir ve kasaya gitmeden hızlıca ödeme yapabilirsiniz.",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16,
                      color: AppColors.gray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            HesapButton(
              label: 'Giriş Yap',
              filled: true,
              onPressed: widget.navigateToLoginScreen,
            ),
            HesapButton(
              label: 'Üye Ol',
              onPressed: widget.navigateToRegisterScreen,
            ),
            Padding(
              padding: const EdgeInsets.all(Insets.m),
              child: TextButton(
                onPressed: widget.signInAnonymously,
                child: const Text(
                  "Üye Olmadan Devam Et",
                  style: TextStyle(color: AppColors.gray),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

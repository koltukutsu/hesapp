import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hesap/ui/screens/on_boarding/components/hesap_linked_label_check_box.dart';
import 'package:hesap/ui/widgets/hesap_button_animated.dart';

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
  bool _isSelectedAydinlatmaMetni = false; // inside the widget not the build
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

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
                  HesapAydinlanmaMetniCheckBox(
                    label: "Aydınlanma Metni",
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 15, left: 40, right: 40),
                    // TODO: aydinlatma metninin pozisyonu ayarlanacak
                    value: _isSelectedAydinlatmaMetni,
                    onChanged: (bool newState) {
                      setState(() {
                        _isSelectedAydinlatmaMetni = newState;
                        if (_isSelectedAydinlatmaMetni) {
                          _crossFadeState = CrossFadeState.showSecond;
                        } else {
                          _crossFadeState = CrossFadeState.showFirst;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            HesapButton(
              label: 'Giriş Yap',
              filled: true,
              onPressed: widget.navigateToLoginScreen,
              // enabled: _isSelectedAydinlatmaMetni,
            ),
            AnimatedCrossFade(
              crossFadeState: _crossFadeState,
              duration: const Duration(milliseconds: 500),
              firstCurve: Curves.easeOut,
              secondCurve: Curves.easeIn,
              firstChild: HesapButton(
                label: 'Üye Ol',
                onPressed: widget.navigateToRegisterScreen,
                enabled: false,
              ),
              secondChild: HesapButton(
                label: 'Üye Ol',
                onPressed: widget.navigateToRegisterScreen,
                enabled: true,
              ),
            ),
            HesapButtonAnimated(
                label: "Buraya Bir Tikla Bakalim",
                onPressed: () {},
                filled: true,
                enabled: true),
            AnimatedCrossFade(
              crossFadeState: _crossFadeState,
              duration: const Duration(milliseconds: 500),
              firstCurve: Curves.easeOut,
              secondCurve: Curves.easeIn,
              firstChild: HesapButtonAnimated(
                  label: "Buraya Bir Tikla Bakalim",
                  onPressed: widget.navigateToRegisterScreen,
                  filled: false,
                  enabled: false),
              secondChild: HesapButtonAnimated(
                  label: "Buraya Bir Tikla Bakalim",
                  onPressed: widget.navigateToRegisterScreen,
                  filled: false,
                  enabled: true),
            ),
            AnimatedCrossFade(
              crossFadeState: _crossFadeState,
              duration: const Duration(milliseconds: 500),
              firstCurve: Curves.easeOut,
              secondCurve: Curves.easeIn,
              firstChild: const Padding(
                // izin verilmiyor
                padding: EdgeInsets.all(Insets.m),
                child: TextButton(
                  onPressed: null,
                  child: Text(
                    "Üye Olmadan Devam Et",
                    style: TextStyle(color: AppColors.gray),
                  ),
                ),
              ),
              secondChild: Padding(
                // izin veriliyor
                padding: const EdgeInsets.all(Insets.m),
                child: TextButton(
                  onPressed: widget.signInAnonymously,
                  child: const Text(
                    "Üye Olmadan Devam Et",
                    style: TextStyle(color: AppColors.gray),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

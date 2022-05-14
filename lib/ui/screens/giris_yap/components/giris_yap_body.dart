import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/colors.dart';
import '../../../theme/insets.dart';
import '../../../widgets/hesap_button.dart';
import '../../../widgets/hesap_text_field.dart';

class GirisYapBody extends StatefulWidget {
  const GirisYapBody({
    Key? key,
    required this.setEmail,
    required this.setPassword,
    required this.signIn,
    required this.signInAnonymously,
    required this.navigateToSignUpScreen,
  }) : super(key: key);

  final Function(String) setEmail;
  final Function(String) setPassword;
  final VoidCallback signIn;
  final VoidCallback navigateToSignUpScreen;
  final VoidCallback signInAnonymously;

  @override
  State<GirisYapBody> createState() => _GirisYapBodyState();
}

class _GirisYapBodyState extends State<GirisYapBody> {
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
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "hesap",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    fontSize: 40.0,
                    letterSpacing: -2,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HesapTextField(
                    label: "E-posta",
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_rounded),
                    onChanged: widget.setEmail,
                  ),
                  HesapTextField(
                    label: "Şifre",
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.password_rounded),
                    maxLength: 6,
                    obscureText: true,
                    onChanged: widget.setPassword,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Insets.s),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        HesapButton(
                          label: 'Üye Ol',
                          onPressed: widget.navigateToSignUpScreen,
                        ),
                        HesapButton(
                          label: 'Giriş Yap',
                          filled: true,
                          onPressed: widget.signIn,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Insets.l),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 64.0,
                          height: 64.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: const CircleBorder(),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/icon_google.svg',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 64.0,
                          height: 64.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: const CircleBorder(),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/icon_facebook.svg',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 64.0,
                          height: 64.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: const CircleBorder(),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/icon_apple.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Insets.l),
                    child: TextButton(
                      onPressed: widget.signInAnonymously,
                      child: const Text("Üye Olmadan Devam Et"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

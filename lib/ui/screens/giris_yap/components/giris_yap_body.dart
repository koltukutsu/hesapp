import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/insets.dart';
import 'package:hesap/ui/widgets/hesap_button.dart';
import 'package:hesap/ui/widgets/hesap_text_field.dart';

class GirisYapBody extends StatefulWidget {
  const GirisYapBody({
    Key? key,
    required this.setEmail,
    required this.setPassword,
    required this.signIn,
    required this.signInAnonymously,
    required this.navigateToRegisterScreen,
  }) : super(key: key);

  final Function(String) setEmail;
  final Function(String) setPassword;
  final VoidCallback signIn;
  final VoidCallback navigateToRegisterScreen;
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
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              maxLength: 12,
              obscureText: true,
              onChanged: widget.setPassword,
            ),
            HesapButton(
              label: 'Giriş Yap',
              filled: true,
              onPressed: widget.signIn,
            ),
          ],
        ),
      ),
    );
  }
}

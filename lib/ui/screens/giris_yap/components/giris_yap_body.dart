import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/insets.dart';
import 'package:hesap/ui/widgets/hesap_button.dart';
import 'package:hesap/ui/widgets/hesap_button_animated.dart';
import 'package:hesap/ui/widgets/hesap_text_field.dart';

class GirisYapBody extends StatefulWidget {
  const GirisYapBody({
    Key? key,
    required this.setEmail,
    required this.setPassword,
    required this.signIn,
    required this.navigateToRegisterScreen,
  }) : super(key: key);

  final Function(String) setEmail;
  final Function(String) setPassword;
  final VoidCallback signIn;
  final VoidCallback navigateToRegisterScreen;

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
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(Icons.password_rounded),
              maxLength: 12,
              obscureText: true,
              onChanged: widget.setPassword,
              suffixIcon: true,
              passwordShow: true,
              hintText: "12 karaktere kadar girebilirsiniz",
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    child: const Text("Üye Ol."),
                    onPressed: widget.navigateToRegisterScreen,
                  ),
                ),
                HesapButtonAnimated(
                  widthRatio: 0.3,
                  label: 'Giriş Yap',
                  filled: true,
                  onPressed: widget.signIn,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

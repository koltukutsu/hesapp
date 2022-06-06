import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hesap/ui/screens/on_boarding/components/hesap_aydinlatma_metni.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/util/animated_route.dart';
import 'package:hesap/util/constants.dart';

// bool _isSelected = false; // inside the widget not the build
// LabeledCheckbox(
// label: 'This is the label text',
// padding: const EdgeInsets.symmetric(horizontal: 20.0),
// value: _isSelected,
// onChanged: (bool newValue) {
// setState(() {
// _isSelected = newValue;
// });
// },
// );

class HesapAydinlanmaMetniCheckBox extends StatelessWidget {
  const HesapAydinlanmaMetniCheckBox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: const <TextSpan>[
                      TextSpan(
                        text: "'ni kabul edin",
                        style: TextStyle(
                            color: AppColors.gray,
                            decoration: TextDecoration.none,
                            fontSize: 10),
                      )
                    ],
                    text: label,
                    style: const TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        fontSize: 12),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            FadeInRoute(
                                page: const HesapAydinlatmaMetni(),
                                routeName: ROUTE_AYINLATMA_METNI));
                        // Navigator.of(context).pushNamed(ROUTE_AYINLATMA_METNI);
                      },
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
        ],
      ),
    );
  }
}

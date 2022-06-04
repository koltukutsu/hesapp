import 'package:flutter/material.dart';

class PaymentAgreement extends StatefulWidget {
  const PaymentAgreement({Key? key}) : super(key: key);

  @override
  State<PaymentAgreement> createState() => _PaymentAgreementState();
}

class _PaymentAgreementState extends State<PaymentAgreement> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: checked,
            onChanged: (newValue) {
              setState(
                () {
                  checked = newValue!;
                },
              );
            },
          ),
          Expanded(
            child: Text(
              "Ön bilgilendirme koşullarını ve Mesafeli satış sözleşmesini okudum, onaylıyorum.",
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HesapFloatingActionButton extends StatelessWidget {
  const HesapFloatingActionButton({Key? key}) : super(key: key);

  void _floatingActionButtonFuction() {}

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _floatingActionButtonFuction();
      },
      child: const Icon(Icons.qr_code_scanner),
    );
  }
}

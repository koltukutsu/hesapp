// necessary
import 'package:flutter/material.dart';

class HesapFloatingActionButton extends StatelessWidget {
  const HesapFloatingActionButton({Key? key, this.icon = Icons.qr_code_scanner})
      : super(key: key);
  final IconData icon;

  void _floatingActionButtonFuction() {}

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _floatingActionButtonFuction();
      },
      child: Icon(icon),
    );
  }
}

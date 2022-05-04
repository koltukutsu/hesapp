import 'package:flutter/material.dart';
import 'package:hesap/theme/colors.dart';

class HesapNormalText extends StatelessWidget {
  const HesapNormalText({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
          fontSize: 40.0,
          letterSpacing: -2,
        ),
      ),
    );
  }
}

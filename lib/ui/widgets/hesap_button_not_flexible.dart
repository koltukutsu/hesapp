import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/insets.dart';

class HesapButtonNotFlexible extends StatelessWidget {
  const HesapButtonNotFlexible({
    Key? key,
    required this.label,
    this.enabled = true,
    this.filled = false,
    this.textSize = 16,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final bool filled;
  final bool enabled;
  final double textSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: SizedBox(
          height: 48.0,
          child: OutlinedButton(
            onPressed: enabled ? onPressed : null,
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w700,
                fontSize: textSize,
                color: enabled
                    ? (filled ? AppColors.white : AppColors.primary)
                    : Colors.grey.shade600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: enabled ? AppColors.primary : Colors.grey.shade600,
                width: 2.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Insets.m),
              ),
              backgroundColor: enabled
                  ? (filled ? AppColors.primary : AppColors.white)
                  : Colors.grey.shade300,
            ),
          ),
        ),
      );
  }
}

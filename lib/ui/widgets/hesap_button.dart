import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/insets.dart';

class HesapButton extends StatelessWidget {
  const HesapButton({
    Key? key,
    required this.label,
    this.enabled = true,
    this.filled = false,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final bool filled;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 48.0,
        child: OutlinedButton(
          onPressed: enabled ? onPressed : null,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
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
              borderRadius: BorderRadius.circular(Insets.s),
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

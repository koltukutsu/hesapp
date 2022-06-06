import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/insets.dart';

class HesapButton extends StatefulWidget {
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
  State<HesapButton> createState() => _HesapButtonState();
}

class _HesapButtonState extends State<HesapButton> {
  @override
  Widget build(BuildContext context) {
    // _scale = 1 - _controller.value;

    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
        ),
        child: OutlinedButton(
          onPressed: widget.enabled ? widget.onPressed : null,
          child: Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: widget.enabled
                  ? (widget.filled ? AppColors.white : AppColors.primary)
                  : Colors.grey.shade600,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: widget.enabled ? AppColors.primary : Colors.grey.shade600,
              width: 2.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Insets.s),
            ),
            backgroundColor: widget.enabled
                ? (widget.filled ? AppColors.primary : AppColors.white)
                : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}

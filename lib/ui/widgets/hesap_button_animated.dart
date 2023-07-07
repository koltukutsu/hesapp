import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/insets.dart';

class HesapButtonAnimated extends StatefulWidget {
  const HesapButtonAnimated({
    Key? key,
    required this.label,
    this.enabled = true,
    this.filled = false,
    this.widthRatio = 0.8,
    this.height = 50,
    this.color = AppColors.primary,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final bool filled;
  final bool enabled;
  final VoidCallback onPressed;
  final double widthRatio;
  final double height;
  final Color color;

  @override
  State<HesapButtonAnimated> createState() => _HesapButtonAnimatedState();
}

class _HesapButtonAnimatedState extends State<HesapButtonAnimated> {
  @override
  Widget build(BuildContext context) {
    // _scale = 1 - _controller.value;

    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: AnimatedButton(
        onPressed: widget.onPressed,
        enabled: widget.enabled,
        width: MediaQuery.of(context).size.width * widget.widthRatio,
        height: widget.height,
        color: widget.enabled
            ? (widget.filled ? widget.color : AppColors.white)
            : Colors.grey.shade100,
        child: Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: widget.enabled
                ? (widget.filled ? AppColors.white : AppColors.primary)
                : Colors.grey.shade100,
          ),
        ),
      ),
    );
  }
}

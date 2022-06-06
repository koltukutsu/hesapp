import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/insets.dart';

class HesapButtonAnimatedWithIcon extends StatefulWidget {
  const HesapButtonAnimatedWithIcon({
    Key? key,
    required this.icon,
    this.enabled = true,
    this.filled = false,
    this.widthRatio = 0.8,
    this.height = 50,
    this.color = AppColors.primary,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final bool filled;
  final bool enabled;
  final VoidCallback onPressed;
  final double widthRatio;
  final double height;
  final Color color;

  @override
  State<HesapButtonAnimatedWithIcon> createState() => _HesapButtonAnimatedWithIconState();
}

class _HesapButtonAnimatedWithIconState extends State<HesapButtonAnimatedWithIcon> {
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
          color: Colors.transparent,
          child: Transform.scale(scale: 2, child: widget.icon)
      ),
    );
  }
}

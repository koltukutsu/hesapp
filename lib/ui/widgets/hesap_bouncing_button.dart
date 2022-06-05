import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';

class HesapBouncingButton extends StatefulWidget {
  const HesapBouncingButton({
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
  _HesapBouncingButton createState() => _HesapBouncingButton();
}

class _HesapBouncingButton extends State<HesapBouncingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: HesapAnimatedButton(
          controller: _controller,
          onPressed: widget.onPressed,
          label: widget.label,
          filled: widget.filled,
          enabled: widget.enabled),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}

class HesapAnimatedButton extends AnimatedWidget {
  final AnimationController _controller;
  final String label;
  final bool filled;
  final bool enabled;
  final VoidCallback onPressed;

  const HesapAnimatedButton({
    required this.label,
    this.enabled = true,
    this.filled = false,
    required this.onPressed,
    required AnimationController controller,
  })  : _controller = controller,
        super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1 - _controller.value,
      child: Container(
        height: 70,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0x80000000),
                blurRadius: 10.0,
                offset: Offset(0.0, 2.0),
              ),
            ],
            gradient: const LinearGradient(
              colors: [
                Color(0xff00e6dc),
                Color(0xff00ffb9),
              ],
            )),
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

import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/insets.dart';

class ProfileExpandableButton extends StatefulWidget {
  const ProfileExpandableButton({
    Key? key,
    required this.title,
    required this.expanded,
    required this.toggle,
  }) : super(key: key);

  final String title;
  final bool expanded;
  final VoidCallback toggle;

  @override
  State<ProfileExpandableButton> createState() =>
      _ProfileExpandableButtonState();
}

class _ProfileExpandableButtonState extends State<ProfileExpandableButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.toggle,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(Insets.s),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Insets.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16.0),
                ),
                Icon(
                  widget.expanded
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

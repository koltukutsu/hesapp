import 'package:flutter/material.dart';
import 'package:hesap/ui/theme/insets.dart';

class ProfileExpandableButton extends StatefulWidget {
  const ProfileExpandableButton({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<ProfileExpandableButton> createState() =>
      _ProfileExpandableButtonState();
}

class _ProfileExpandableButtonState extends State<ProfileExpandableButton> {
  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;

    return Padding(
      padding: const EdgeInsets.all(Insets.s),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPress: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(Insets.s),
            ),
            color: Colors.grey.shade300,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Insets.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.title),
                Icon(
                  isExpanded
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

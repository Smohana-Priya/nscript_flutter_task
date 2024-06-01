import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircularButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Color color;
  final Color? borderColor;
  void Function()? onPressed;
  final Color? textColor;

  CircularButton({
    super.key,
    this.icon,
    this.text,
    required this.color,
    this.borderColor,
    this.onPressed,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color,
            border:
                borderColor != null ? Border.all(color: borderColor!) : null,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: icon != null
                ? Icon(
                    icon,
                  )
                : Text(
                    text!,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

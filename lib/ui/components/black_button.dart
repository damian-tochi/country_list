import 'package:flutter/material.dart';


class BlackButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String label;
  final Widget? icon;
  final double? iconGap;
  final Function? onTap;
  final Color? color;
  final Color? textColor;
  final double? padding;
  final double? radius;
  final TextStyle? textStyle;

  const BlackButton({
    super.key,
    required this.label,
    this.icon,
    this.iconGap,
    this.onTap,
    this.color,
    this.textColor,
    this.padding,
    this.radius,
    this.height,
    this.width,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 30),
          color: Colors.black,
        ),
        padding: EdgeInsets.all(padding ?? (icon != null ? 16.0 : 18.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            icon != null
                ? SizedBox(width: iconGap ?? 20)
                : const SizedBox.shrink(),
            Flexible(
              child: Text(label!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

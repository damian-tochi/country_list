import 'package:flutter/material.dart';

class InactiveCustomButton extends StatelessWidget {
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

  const InactiveCustomButton({
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
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFD7D7D7),
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
              child: Text(label,
                textAlign: TextAlign.center,
                style: textStyle ??
                    theme.textTheme.titleMedium!.copyWith(
                        color: textColor ?? theme.scaffoldBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:metro_pay/Consts/global_func.dart';
import '../../Theme/colors.dart';


class WhiteButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? label;
  final Widget? icon;
  final double? iconGap;
  final Function? onTap;
  final Color? color;
  final Color? textColor;
  final double? padding;
  final double? radius;
  final TextStyle? textStyle;

  const WhiteButton({
    super.key,
    this.label,
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
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap as void Function()?,
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: HexColor.fromHex("#D7D7D7"), width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 30),
            ),
            foregroundColor: Colors.black,
            padding: EdgeInsets.all(padding ?? (icon != null ? 16.0 : 18.0)),
        ),
        child: Text(label!,
          textAlign: TextAlign.center,
          style: textStyle ??
              theme.textTheme.titleMedium!.copyWith(
                  color: textColor ?? theme.scaffoldBackgroundColor),
        ),
      ),
    );
  }
}

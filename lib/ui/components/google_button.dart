import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/Consts/global_func.dart';
import '../../Theme/colors.dart';


class GoogleButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Function? onTap;
  final double? padding;

  const GoogleButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: height,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap as void Function()?,
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: HexColor.fromHex("#D7D7D7"), width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            foregroundColor: Colors.black,
            padding: EdgeInsets.all(padding ?? 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SvgPicture.asset(
            'assets/images/google_ico.svg',
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 10,),
            FittedBox(
              child: AutoSizeText("Sign Up with Google",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium!.copyWith(
                    color: Colors.black),
                maxFontSize: 16,
                minFontSize: 1,
                maxLines: 1,
              ),
            ),
        ],)
      ),
    );
  }
}

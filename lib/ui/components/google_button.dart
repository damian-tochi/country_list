import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/Consts/global_func.dart';
import '../../Theme/colors.dart';


class GoogleButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Function? onTap;

  const GoogleButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
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
              borderRadius: BorderRadius.circular(30),
            ),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.all(18.0),
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
          Text("Sign Up with Google",
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium!.copyWith(
                color: Colors.black),
          ),
        ],)
      ),
    );
  }
}

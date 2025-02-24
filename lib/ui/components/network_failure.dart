import 'package:african_countries/consts/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../Theme/colors.dart';
import '../../consts/app_icons.dart';

class NetworkFailure extends StatelessWidget {
  final String msg;
  const NetworkFailure({
    super.key, required this.msg
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(color: CustomTheme.blackAccent),
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.asset(
              AppIcons.error,
              width: screenWidth / 1.5,
              height: screenWidth / 1.5,
              fit: BoxFit.contain,
            ),
            Text(msg,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: normalTextSize,
                  fontWeight: FontWeight.normal),),
          ],)
        ),
      ),
    );
  }
}

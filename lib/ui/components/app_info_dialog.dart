import 'dart:ui';

import 'package:african_countries/consts/app_icons.dart';
import 'package:african_countries/consts/values.dart';
import 'package:african_countries/ui/components/width.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppInfoDialog extends StatefulWidget {
  const AppInfoDialog({super.key});

  @override
  State createState() {
    return AppInfoDialogState();
  }
}

class AppInfoDialogState extends State<AppInfoDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: const Color(0xFFF9F9F9),
        surfaceTintColor: Colors.white,
        insetPadding: EdgeInsets.zero,
        title: Container(
          padding: EdgeInsets.only(
              top: screenHeight / 32, left: 1, right: 20, bottom: 20),
          child: IntrinsicHeight(
            child: Stack(
              children: [
                const Align(
                  child: Text("About",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: normalTextSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(AppIcons.arrowRightBlack,
                      width: 30.0,
                      height: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        content: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'A Flutter app that displays a list of African countries along with relevant details.',
                style: TextStyle(
                    fontFamily: 'Paradroid',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: smallTextSize),
              ),
              height(
                20,
              ),
              const Text(
                'Features:',
                style: TextStyle(
                    fontFamily: 'Paradroid',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: mediumTextSize),
              ),
              const Text(
                'Displays a list of African countries',
                style: TextStyle(
                    fontFamily: 'Paradroid',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: smallTextSize),
              ),
              height(
                5,
              ),
              const Text(
                'Country details are shown when a user selects a country',
                style: TextStyle(
                    fontFamily: 'Paradroid',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: smallTextSize),
              ),
              height(
                5,
              ),
              const Text(
                'State is managed with BLoC',
                style: TextStyle(
                    fontFamily: 'Paradroid',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: smallTextSize),
              ),
              height(
                20,
              ),
              const Text(
                'API Endpoints:',
                style: TextStyle(
                    fontFamily: 'Paradroid',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: mediumTextSize),
              ),
              const Text(
                "List countries in Africa: https://restcountries.com/v3.1/region/africa?status=true&fields=name,languages,capital,flags",
                style: TextStyle(
                    fontFamily: 'Paradroid',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: smallTextSize),
              ),
              height(
                5,
              ),
              const Text(
                "Get country details by name: https://restcountries.com/v3.1/name/{name}",
                style: TextStyle(
                    fontFamily: 'Paradroid',
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: smallTextSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

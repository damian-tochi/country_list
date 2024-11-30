import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/ui/components/white_button.dart';
import '../../../Consts/global_func.dart';
import '../../../Routes/login_navigator.dart';
import '../../../Theme/colors.dart';
import '../../components/green_button.dart';

class StartUi extends StatefulWidget {
  const StartUi({super.key});

  @override
  _StartUiState createState() => _StartUiState();
}

class _StartUiState extends State<StartUi> {
  bool _isCentered = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    final screenSize = MediaQuery.of(context).size;
    setState(() {
      _isCentered = !_isCentered;
    });
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Stack(children: [
                  // AnimatedPositioned(
                  //   duration: const Duration(seconds: 2),
                  //   curve: Curves.easeInOut,
                  //   top: _isCentered
                  //       ? screenSize.height / 2 - 130
                  //       : screenSize.height / 4,
                  //   left: _isCentered
                  //       ? screenSize.width / 2 - 130
                  //       : screenSize.width - 100,
                  //   child: SizedBox(
                  //     width: 300,
                  //     height: 300,
                  //     child: Image.asset('assets/images/car.png'),
                  //   ),
                  // ),
                  AnimatedPositioned(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    top: _isCentered
                        ? screenSize.height / 2 - 230
                        : screenSize.height / 7,
                    left: _isCentered
                        ? screenSize.width / 2 - 150
                        : screenSize.width - 40,
                    right: _isCentered
                        ? screenSize.width / 2 - 150
                        : -100,
                    child: SizedBox(
                      width: 320,
                      height: 320,
                      child: Image.asset('assets/images/car.png'),
                    ),
                  ),
                ]),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenWidth / 9,
                      child: AutoSizeText(
                        "The greener way to drive",
                        style: TextStyle(
                          color: HexColor.fromHex('#404042'),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Interphases',
                          fontSize: 18,
                        ),
                        minFontSize: 5,
                        maxFontSize: 20,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      child: AutoSizeText(
                        "Congratulations! you have successfully\nuploaded your proof of address.",
                        style: TextStyle(
                          color: HexColor.fromHex('#404042'),
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Interphases',
                          fontSize: 15,
                        ),
                        minFontSize: 5,
                        maxFontSize: 12,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GreenButton(
                  onTap: () {
                    Navigator.pushNamed(context, LoginRoutes.signUpRoot);
                  },
                  color: primaryColor,
                  label: 'Get Started',
                  textColor: Colors.black,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: WhiteButton(
                  onTap: () {
                    Navigator.pushNamed(context, LoginRoutes.loginRoot);
                  },
                  color: primaryColor,
                  label: 'Login',
                  textColor: Colors.black,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                const Spacer(flex: 1,),
                SvgPicture.asset(
                  'assets/images/first_img.svg',
                  width: screenWidth / 2,
                  height: screenHeight / 2 + 100,
                ),
                const Spacer(flex: 3,),
              ]),
              Column(
                children: [
                  SizedBox(
                    width: screenWidth / 2,
                    height: screenHeight / 2 + 100,
                    child: SvgPicture.asset(
                      'assets/images/second_img.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 2,
                    height: screenHeight / 2 + 200,
                    child: SvgPicture.asset(
                      'assets/images/third_img.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

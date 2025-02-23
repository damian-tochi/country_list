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

class _StartUiState extends State<StartUi> with TickerProviderStateMixin {
  late AnimationController _firstImagesController;
  late AnimationController _carController;
  late AnimationController _buttonsController;
  late Animation<Offset> _leftImageAnimation;
  late Animation<Offset> _rightImageAnimation;
  late Animation<Offset> _rightSecondImageAnimation;
  late Animation<Offset> _carAnimation;
  late Animation<double> _buttonsFadeAnimation;

  @override
  void initState() {
    super.initState();

    _firstImagesController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _carController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _buttonsController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _leftImageAnimation = Tween<Offset>(
      begin: Offset(-1.5, 0),
      end: Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: _firstImagesController, curve: Curves.easeOut));

    _rightImageAnimation = Tween<Offset>(
      begin: Offset(1.5, 0),
      end: Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: _firstImagesController, curve: Curves.easeOut));

    _rightSecondImageAnimation = Tween<Offset>(
      begin: Offset(1.5, 0),
      end: Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: _firstImagesController, curve: Curves.easeOut));

    _carAnimation = Tween<Offset>(
      begin: Offset(1.5, -1.5),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _carController, curve: Curves.easeOut));

    _buttonsFadeAnimation =
        CurvedAnimation(parent: _buttonsController, curve: Curves.easeIn);

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        startAnimation = true;
      });
    });

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _firstImagesController.forward();
    await _carController.forward();
    await _buttonsController.forward();
  }

  @override
  void dispose() {
    _firstImagesController.dispose();
    _carController.dispose();
    _buttonsController.dispose();
    super.dispose();
  }

  bool startAnimation = false;
  bool showButtons = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SlideTransition(
                        position: _carAnimation,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 2.7),
                          child: Image.asset(
                            'assets/images/car.png',
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 3,
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              const Spacer(
                                flex: 1,
                              ),
                              SlideTransition(
                                position: _leftImageAnimation,
                                child: SvgPicture.asset(
                                  'assets/images/first_img.svg',
                                  width: MediaQuery.of(context).size.width / 4,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                ),
                              ),
                              const Spacer(
                                flex: 3,
                              ),
                            ]),
                            Column(
                              children: [
                                SlideTransition(
                                  position: _rightImageAnimation,
                                  child: SvgPicture.asset(
                                    'assets/images/second_img.svg',
                                    width: screenWidth / 2,
                                    height: screenHeight / 3,
                                  ),
                                ),
                                SlideTransition(
                                  position: _rightSecondImageAnimation,
                                  child: SvgPicture.asset(
                                    'assets/images/third_img.svg',
                                    width: screenWidth / 2,
                                    height: screenHeight / 2,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 5,
                ),
                FadeTransition(
                  opacity: _buttonsFadeAnimation,
                  child: Container(
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
                              fontSize: 12,
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
                ),
                FadeTransition(
                  opacity: _buttonsFadeAnimation,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: GreenButton(
                          padding: 12,
                          height: screenHeight / 17,
                          onTap: () {
                            Navigator.pushNamed(
                                context, LoginRoutes.signUpRoot);
                          },
                          color: primaryColor,
                          label: 'Get Started',
                          textColor: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: WhiteButton(
                          padding: 12,
                          height: screenHeight / 17,
                          onTap: () {
                            Navigator.pushNamed(context, LoginRoutes.loginRoot);
                          },
                          color: primaryColor,
                          label: 'Login',
                          textColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// bool _isCentered = false;
//
// @override
// Widget build(BuildContext context) {
//   double screenWidth = MediaQuery.of(context).size.width;
//   double screenHeight = MediaQuery.of(context).size.width;
//   final screenSize = MediaQuery.of(context).size;
//   setState(() {
//     _isCentered = !_isCentered;
//   });
//   return Scaffold(
//     body: Stack(
//       children: [
//         Column(
//           children: [
//             Expanded(
//               flex: 5,
//               child: Stack(children: [
//                 // AnimatedPositioned(
//                 //   duration: const Duration(seconds: 2),
//                 //   curve: Curves.easeInOut,
//                 //   top: _isCentered
//                 //       ? screenSize.height / 2 - 130
//                 //       : screenSize.height / 4,
//                 //   left: _isCentered
//                 //       ? screenSize.width / 2 - 130
//                 //       : screenSize.width - 100,
//                 //   child: SizedBox(
//                 //     width: 300,
//                 //     height: 300,
//                 //     child: Image.asset('assets/images/car.png'),
//                 //   ),
//                 // ),
//                 AnimatedPositioned(
//                   duration: const Duration(seconds: 1),
//                   curve: Curves.easeInOut,
//                   top: _isCentered
//                       ? screenSize.height / 2 - 230
//                       : screenSize.height / 7,
//                   left: _isCentered
//                       ? screenSize.width / 2 - 150
//                       : screenSize.width - 40,
//                   right: _isCentered
//                       ? screenSize.width / 2 - 150
//                       : -100,
//                   child: SizedBox(
//                     width: 320,
//                     height: 320,
//                     child: Image.asset('assets/images/car.png'),
//                   ),
//                 ),
//               ]),
//             ),
//             Container(
//               color: Colors.white,
//               padding: const EdgeInsets.only(bottom: 20.0),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: screenWidth / 9,
//                     child: AutoSizeText(
//                       "The greener way to drive",
//                       style: TextStyle(
//                         color: HexColor.fromHex('#404042'),
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Interphases',
//                         fontSize: 18,
//                       ),
//                       minFontSize: 5,
//                       maxFontSize: 20,
//                       maxLines: 1,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   SizedBox(
//                     child: AutoSizeText(
//                       "Congratulations! you have successfully\nuploaded your proof of address.",
//                       style: TextStyle(
//                         color: HexColor.fromHex('#404042'),
//                         fontWeight: FontWeight.normal,
//                         fontFamily: 'Interphases',
//                         fontSize: 15,
//                       ),
//                       minFontSize: 5,
//                       maxFontSize: 12,
//                       maxLines: 2,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: GreenButton(
//                 onTap: () {
//                   Navigator.pushNamed(context, LoginRoutes.signUpRoot);
//                 },
//                 color: primaryColor,
//                 label: 'Get Started',
//                 textColor: Colors.black,
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: WhiteButton(
//                 onTap: () {
//                   Navigator.pushNamed(context, LoginRoutes.loginRoot);
//                 },
//                 color: primaryColor,
//                 label: 'Login',
//                 textColor: Colors.black,
//               ),
//             ),
//             const Spacer(
//               flex: 1,
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(children: [
//               const Spacer(flex: 1,),
//               SvgPicture.asset(
//                 'assets/images/first_img.svg',
//                 width: screenWidth / 2,
//                 height: screenHeight / 2 + 100,
//               ),
//               const Spacer(flex: 3,),
//             ]),
//             Column(
//               children: [
//                 SizedBox(
//                   width: screenWidth / 2,
//                   height: screenHeight / 2 + 100,
//                   child: SvgPicture.asset(
//                     'assets/images/second_img.svg',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 SizedBox(
//                   width: screenWidth / 2,
//                   height: screenHeight / 2 + 200,
//                   child: SvgPicture.asset(
//                     'assets/images/third_img.svg',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ],
//     ),
//   );
// }
}

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../components/black_button.dart';

class MyQrCode extends StatefulWidget {
  const MyQrCode({super.key});

  @override
  MyQrCodeState createState() => MyQrCodeState();
}

class MyQrCodeState extends State<MyQrCode> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.sizeOf(context).height / 10;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x9FBAE5A4),
              Color(0xFFBAE5A4),
            ],
          ),
        ),
        padding: EdgeInsets.only(
            top: topPadding, left: screenWidth / 20, right: screenWidth / 20),
        child: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      const Align(
                        child: Text(
                          'My QR Code',
                          style: TextStyle(
                              color: Color(0xFF040405),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/images/arrow-left-black.svg',
                            width: 25.0,
                            height: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffDEBAED),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                "Tomi Olatunji",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF040405),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              const Text(
                "Personal Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF696969),
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
              const Spacer(
                flex: 2,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: QrImageView(
                  data: '1234567890',
                  version: QrVersions.auto,
                  size: 270.0,
                  padding: const EdgeInsets.all(12),
                  backgroundColor: Colors.white,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                "Scan this code to proceed with the transaction. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF696969),
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
              const Spacer(
                flex: 3,
              ),
              BlackButton(
                label: 'Share my QR Code',
                onTap: () {},
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

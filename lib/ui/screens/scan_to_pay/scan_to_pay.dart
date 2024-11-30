import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../Routes/routes.dart';


class ScanToPay extends StatefulWidget {
  const ScanToPay({super.key});

  @override
  ScanToPayState createState() => ScanToPayState();
}

class ScanToPayState extends State<ScanToPay> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final topPadding = MediaQuery.sizeOf(context).height / 10;

    return Scaffold(
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.23),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.white,
                      borderRadius: 10,
                      borderLength: 25,
                      borderWidth: 9,
                      cutOutSize: 300,
                    ),
                  ),
                ),
              ],
            ),

            Container(
                padding: EdgeInsets.only(
                    top: topPadding,
                    left: screenWidth / 20,
                    right: screenWidth / 20,
                bottom: topPadding),
                child:  Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        const Align(
                          child: Text(
                            'Scan to Pay',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
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
                              'assets/images/arrow-left-white.svg',
                              width: 25.0,
                              height: 25.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                const AutoSizeText(
                  "Ensure the code is properly centred and all sides of\nthe code are in the box above.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                  maxLines: 2,
                  maxFontSize: 15,
                  minFontSize: 5,
                ),
              ],
            ),),

          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (kDebugMode) {
        print('QR Code Scanned: ${scanData.code}');
      }
      controller.pauseCamera();
      Navigator.pushNamed(context, PageRoutes.sendMoneyConfirmation, arguments: scanData.code);
    });
  }
}

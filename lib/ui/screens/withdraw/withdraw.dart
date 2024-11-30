import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/ui/components/recipients_card.dart';

import '../../../Consts/global_func.dart';
import '../../../Routes/routes.dart';
import '../send_money/receipients.dart';


class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  WithdrawState createState() => WithdrawState();
}

class WithdrawState extends State<Withdraw> {
  List<Recipient> optionsList = [
    Recipient(
      'Abiola Folashade',
      'GTBank . 0128047294',
      'assets/images/gtb.png',
    ),
    Recipient(
      'Oluwatimileyin Famakin',
      'Zenith Bank . 0128047294',
      'assets/images/zenith.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.sizeOf(context).height / 12;
    final itemWidth = screenWidth / 3;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF9F9F9),
              Color(0xFFF9F9F9),
            ],
          ),
        ),
        padding: EdgeInsets.only(
          top: topPadding,
        ),
        child: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.only(
                    left: screenWidth / 20, right: screenWidth / 20),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      const Align(
                        child: Text(
                          'Withdraw ',
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

              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffF9F9F9),
                  ),
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.only(
                            left: 10, top: 20, right: 10, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Select account',
                              style: TextStyle(
                                  color: Color(0xFF696969),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),
                            ),

                            const SizedBox(height: 10,),

                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: optionsList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return RecipientsCard(
                                  device: optionsList[index],
                                  onTap: () {
                                    Navigator.pushNamed(context, PageRoutes.withdrawAmount);
                                  },
                                );
                              },
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

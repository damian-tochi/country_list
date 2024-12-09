import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:metro_pay/consts/app_icons.dart';
import 'package:metro_pay/ui/components/inactive_custom_button.dart';

import '../../components/number_input_keyboard.dart';

class FundBalance extends StatefulWidget {
  const FundBalance({super.key});

  @override
  FundBalanceState createState() => FundBalanceState();
}

class FundBalanceState extends State<FundBalance> {
  final NumberFormat formatter = NumberFormat('#,##0', 'en_US');
  final _pinController = TextEditingController();

  String formatText(TextEditingValue text) {
    final newText = text.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (newText.isEmpty) return text.copyWith(text: '').toString();
    final formatted = formatter.format(int.parse(newText));

    return formatted;
  }

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
                          'Fund Balance',
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(AppIcons.walletAddIcon,
                              width: 25.0,
                              height: 25.0,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              child: SizedBox(
                                child: Text(
                                  'How would you like to fund your balance?',
                                  style: TextStyle(
                                      color: Color(0xFF696969),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            SvgPicture.asset(AppIcons.smallDownArrow,
                              width: 20.0,
                              height: 20.0,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, right: 10, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffF4F4F4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 40, top: 10, right: 40, bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(AppIcons.nairaIcon,
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                    const Flexible(
                                      child: Text(
                                        '0.00',
                                        style: TextStyle(
                                            color: Color(0xFF696969),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 40),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                width: screenWidth,
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Available Balance: ',
                                      style: TextStyle(
                                          color: Color(0xFF696969),
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      '₦324,000.31',
                                      style: TextStyle(
                                          color: Color(0xFF040405),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.all(5),
                                child: InactiveCustomButton(
                                onTap: () {},
                                label: 'Continue',
                                textColor: Colors.white,
                              ),),
                              
                              Container(
                                height: 275,
                                color: const Color(0xFFFFFFFF),
                                padding: const EdgeInsets.only(bottom: 1),
                                child: NumberKeyboard(
                                  onKeyboardTap: (value) {
                                    if (value == 'delete') {
                                      _pinController.text = _pinController.text
                                          .substring(0,
                                              _pinController.text.length - 1);
                                    } else {
                                      _pinController.text += value;
                                    }
                                  },
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
            ],
          ),
        ),
      ),
    );
  }
}

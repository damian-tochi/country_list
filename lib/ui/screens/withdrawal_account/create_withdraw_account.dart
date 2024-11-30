import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/ui/components/green_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../Consts/global_func.dart';
import '../../../Routes/routes.dart';
import '../../../Theme/colors.dart';
import '../../components/inactive_custom_button.dart';
import '../../components/number_input_keyboard.dart';


class CreateWithdrawAccount extends StatefulWidget {
  const CreateWithdrawAccount({super.key});

  @override
  CreateWithdrawAccountState createState() => CreateWithdrawAccountState();
}

class CreateWithdrawAccountState extends State<CreateWithdrawAccount> {
  final _pinController = TextEditingController();

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
                            SvgPicture.asset(
                              'assets/images/wallet-add-icon.svg',
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
                            SvgPicture.asset(
                              'assets/images/small-arrow-down.svg',
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
                                    SvgPicture.asset(
                                      'assets/images/naira_ico.svg',
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
                                child: GreenButton(
                                  onTap: () {},
                                  label: 'Continue',
                                  textColor: Colors.black,
                                ),
                              ),
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

  showSuccessBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: false,
        enableDrag: false,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
            width: double.maxFinite,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Beneficiary\nAdded",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: HexColor.fromHex("#59616D"),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ],
                      )),
                      Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(left: 25),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor.fromHex("#8048FF"),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: SvgPicture.asset(
                              'assets/profile-add_white.svg',
                              width: 20,
                              height: 20,
                              fit: BoxFit.fill,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: HexColor.fromHex("#FFFFFF"),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset(
                                  'assets/channelle.jpg',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                              )),
                          const SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                " beneficiaryReqObject!.accountName",
                                style: CustomTheme.label.copyWith(
                                  color: HexColor.fromHex('#040405'),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "beneficiaryReqObject!.bankName",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: HexColor.fromHex('#040405'),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w100,
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 4,
                                    height: 4,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor.fromHex("#8048FF"),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "beneficiaryReqObject!.accountNumber",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: HexColor.fromHex('#040405'),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w100,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: GreenButton(
                      onTap: () {
                        Navigator.popUntil(
                            context,
                            ModalRoute.withName(
                              PageRoutes.appNavigation,
                            ));
                      },
                      color: primaryColor,
                      label: "Done",
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

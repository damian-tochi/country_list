import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/ui/components/green_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../Consts/global_func.dart';
import '../../../Routes/routes.dart';
import '../../../Theme/colors.dart';
import '../../components/number_input_keyboard.dart';


class AddBeneficiaryPin extends StatefulWidget {
  const AddBeneficiaryPin({super.key});

  @override
  AddBeneficiaryPinState createState() => AddBeneficiaryPinState();
}

class AddBeneficiaryPinState extends State<AddBeneficiaryPin> {

  final TextEditingController phoneController = TextEditingController();

  final _pinController = TextEditingController();

  // BeneficiaryReqObject? beneficiaryReqObject;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // final beneficiaryArg = ModalRoute.of(context)!.settings.arguments as BeneficiaryReqObject;
    // beneficiaryReqObject = beneficiaryArg;
    return Scaffold(
      body:Stack(children: [ FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  GlobalFunc.stringToMaterialColor("#E8E2F5"),
                  GlobalFunc.stringToMaterialColor("#FFFFFF"),
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/arrow-left.svg',
                                    width: 25.0,
                                    height: 20.0,
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: HexColor.fromHex('#040405'),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                        ),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'Add Beneficiary',
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ],
                      ),
                      const SizedBox(height: 10,)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 12),
                      child: RichText(
                        text: TextSpan(
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: HexColor.fromHex("#59616D"),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                          children: const <TextSpan>[
                            TextSpan(
                              text:
                                  'Enter 4-digit PIN to add beneficiary.',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    height: 100,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: primaryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "beneficiaryArg.bankName",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.black,
                                        fontSize: 14,
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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "beneficiaryArg.accountNumber",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Text(
                                        "beneficiaryArg.accountName",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: HexColor.fromHex("#EDE5FE"),
                              ),
                            ),
                            Center(
                              child: Text(
                                getTitleHDTxt("beneficiaryArg.accountName"),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: HexColor.fromHex("#040405"),
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Container(
                                height: 18,
                                width: 18,
                                margin:
                                    const EdgeInsets.only(top: 30, left: 30),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: HexColor.fromHex("#FFFFFF"),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    'assets/gtbank.jpg',
                                    width: 18,
                                    height: 18,
                                    fit: BoxFit.fill,
                                  ),
                                ))
                          ],
                        ),
                      ],
                    )),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.23,
                      left: MediaQuery.of(context).size.width * 0.23),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: PinCodeTextField(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      obscureText: true,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      textStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 55,
                        fieldWidth: 40,
                        borderWidth: 1,
                        selectedFillColor: Colors.grey,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        inactiveColor: HexColor.fromHex("#D7DBDD"),
                        activeColor: Colors.white,
                        selectedColor: HexColor.fromHex("#D7DBDD"),
                      ),
                      cursorColor: Colors.black87,
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      controller: _pinController,
                      keyboardType: TextInputType.none,
                      onCompleted: (v) {},
                      onChanged: (value) {
                        setState(() {
                          if (value.length == 4) {
                            // createBeneficiary();
                          }
                        });
                      },
                      appContext: context,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    color: HexColor.fromHex('#D5DBE5'),
                    padding: const EdgeInsets.only(bottom: 10),
                    child: NumberKeyboard(
                      onKeyboardTap: (value) {
                        if (value == 'delete') {
                          _pinController.text = _pinController.text
                              .substring(0, _pinController.text.length - 1);
                        } else {
                          _pinController.text += value;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
        // isLoading ? const NetworkLoaderAnim() : Container(),
    ]
    ));
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

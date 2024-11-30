import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Consts/global_func.dart';
import '../../../Routes/login_navigator.dart';
import '../../../Routes/routes.dart';
import '../../../Theme/colors.dart';
import '../../components/green_button.dart';
import '../../components/pin_entry_text.dart';


class TokenInput extends StatefulWidget {
  const TokenInput({super.key});


  @override
  _TokenInputState createState() => _TokenInputState();
}

class _TokenInputState extends State<TokenInput> {

  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                GlobalFunc.stringToMaterialColor("#F8F8FF"),
                GlobalFunc.stringToMaterialColor("#F4F4FB"),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 80.0, left: 20, right: 20, bottom: 20),
                color: Colors.white,
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      const Align(
                        child: Text("Enter OTP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/images/arrow_left_ico.svg',
                            width: 30.0,
                            height: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Text(
                "Forgot Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),

              PinEntryTextField(onSubmit: (String value) {

              }, pinController: _pinController,),

              const Spacer(),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: GreenButton(
                  onTap: () {
                    Navigator.popAndPushNamed(
                      context,
                      PageRoutes.appNavigation,
                    );
                  },
                  color: primaryColor,
                  label: 'Continue',
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

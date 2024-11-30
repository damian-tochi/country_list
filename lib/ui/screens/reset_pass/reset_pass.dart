import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/ui/components/google_button.dart';
import '../../../Consts/global_func.dart';
import '../../../Routes/login_navigator.dart';
import '../../../Theme/colors.dart';
import '../../components/auth_input_field.dart';
import '../../components/auth_password_field.dart';
import '../../components/green_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final FocusNode confirmPassNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode submitBtnNode = FocusNode();

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
                        child: Text("Reset Password",
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
              AuthPasswordField(label: "New Password", controller: passwordController, focusNode: passwordNode, nextFocus: confirmPassNode,),
              AuthPasswordField(label: "Confirm New Password", controller: confirmPassController, focusNode: confirmPassNode, nextFocus: submitBtnNode,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 10, right: 10),
                      child: const Text(
                        "Forgot Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: GreenButton(
                  onTap: () {
                    Navigator.pushNamed(context, LoginRoutes.onboardTokenInput);
                  },
                  color: primaryColor,
                  label: 'Continue',
                  textColor: Colors.black,
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

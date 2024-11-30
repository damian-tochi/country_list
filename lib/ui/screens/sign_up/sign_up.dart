import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Consts/global_func.dart';
import '../../../Routes/login_navigator.dart';
import '../../../Theme/colors.dart';
import '../../components/auth_input_field.dart';
import '../../components/auth_password_field.dart';
import '../../components/google_button.dart';
import '../../components/green_button.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final FocusNode firstNameNode = FocusNode();
  final FocusNode lastNameNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode confirmPassNode = FocusNode();
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
                    padding: const EdgeInsets.only(top: 80.0, left: 20, right: 20, bottom: 20),
                    color: Colors.white,
                    child: IntrinsicHeight(
                      child: Stack(
                        children: [
                          const Align(
                            child: Text("Create your account",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                          Positioned(
                            left: 0,
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: SvgPicture.asset(
                                'assets/images/arrow_left_ico.svg',
                                width: 30.0,
                                height: 25.0,
                              ),
                            ),),
                        ],
                      ),
                    ),
                  ),
                  AuthInputField(label: "First Name (must match Legal ID)", controller: firstNameController, focusNode: firstNameNode, nextFocus: lastNameNode,),
                  AuthInputField(label: "Last Name (must match Legal ID)", controller: lastNameController, focusNode: lastNameNode, nextFocus: emailNode,),
                  AuthInputField(icon: 'assets/images/mail_ico.svg', label: "Email", controller: emailController, focusNode: emailNode, nextFocus: passwordNode,),
                  AuthPasswordField(label: "Password", controller: passwordController, focusNode: passwordNode, nextFocus: confirmPassNode,),
                  AuthPasswordField(label: "Confirm Password", controller: confirmPassController, focusNode: confirmPassNode, nextFocus: submitBtnNode,),

                  const Spacer(),

                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'By clicking to proceed, you consent to\nour ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'Term and Conditions.',
                          style: TextStyle(
                              decoration: TextDecoration.underline, color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: GreenButton(
                      onTap: () {
                        Navigator.pushNamed(context, LoginRoutes.onboardTokenInput);
                      },
                      color: primaryColor,
                      label: 'Create Account',
                      textColor: Colors.black,
                    ),
                  ),

                  const Text("or",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 16)),

                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: GoogleButton(
                      onTap: () {

                      },
                    ),
                  ),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, LoginRoutes.loginRoot);
                            },
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            )
        )
    );
  }

}

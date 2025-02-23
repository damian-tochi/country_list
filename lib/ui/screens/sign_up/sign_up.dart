import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Consts/global_func.dart';
import '../../../Routes/login_navigator.dart';
import '../../../Theme/colors.dart';
import '../../../data/cubits/auth_cubit.dart';
import '../../../data/helpers/api_state.dart';
import '../../components/alerts.dart';
import '../../components/auth_input_field.dart';
import '../../components/auth_password_field.dart';
import '../../components/google_button.dart';
import '../../components/green_button.dart';
import '../../components/network_loader.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    final apiCubit = context.read<AuthApiCubit>();

    return BlocListener<AuthApiCubit, ApiState>(
      listener: (context, state) {
        if (state is ApiSuccessString) {
          if (state.data == 'Register') {
            Navigator.pushNamed(context, LoginRoutes.onboardTokenInput);
          }
        }
        // if (state is ApiErrorMsg) {
        //   redFailedAlert(state.error, context);
        // }
        // if (state is ApiFailure) {
        //   redFailedAlert(state.failure, context);
        // }
        // if (state is ApiErrorRegisterOnlyMsg) {
        //   redFailedAlert(state.error, context);
        // }
      },
      child: Scaffold(
        body: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: BlocBuilder<AuthApiCubit, ApiState>(
            builder: (context, authState) => Scaffold(
              body: Stack(children: [
                Container(
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
                        padding: EdgeInsets.only(top: screenHeight / 12, left: 5, right: 20, bottom: 20),
                        color: Colors.white,
                        child: IntrinsicHeight(
                          child: Stack(
                            children: [
                              const Align(
                                child: Text("Create your account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: SvgPicture.asset(
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
                      AuthInputField(
                        label: "First Name (must match Legal ID)",
                        controller: firstNameController,
                        focusNode: firstNameNode,
                        nextFocus: lastNameNode,
                        height: screenHeight / 17,
                        onChanged: (String value) {  },
                      ),
                      AuthInputField(
                        label: "Last Name (must match Legal ID)",
                        controller: lastNameController,
                        focusNode: lastNameNode,
                        height: screenHeight / 17,
                        nextFocus: emailNode, onChanged: (String value) {  },

                      ),
                      AuthInputField(
                        icon: 'assets/images/mail_ico.svg',
                        label: "Email",
                        controller: emailController,
                        focusNode: emailNode,
                        height: screenHeight / 17,
                        nextFocus: passwordNode, onChanged: (String value) {  },

                      ),
                      AuthPasswordField(
                        label: "Password",
                        controller: passwordController,
                        focusNode: passwordNode,
                        nextFocus: confirmPassNode,
                        height: screenHeight / 17,
                        onChanged: (String value) {  },
                      ),
                      AuthPasswordField(
                        label: "Confirm Password",
                        controller: confirmPassController,
                        focusNode: confirmPassNode,
                        nextFocus: submitBtnNode,
                        height: screenHeight / 17,
                        onChanged: (String value) {  },
                      ),
                      const Spacer(flex: 1,),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'By clicking to proceed, you consent to\nour ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: 'Term and Conditions.',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: GreenButton(
                          padding: 12,
                          height: screenHeight / 17,
                          onTap: () {
                            apiCubit.verifyData(firstNameController.text, lastNameController.text, emailController.text, passwordController.text, confirmPassController.text, context);
                          },
                          color: primaryColor,
                          label: 'Create Account',
                          textColor: Colors.black,
                        ),
                      ),
                      const Text("or",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: GoogleButton(
                          height: screenHeight / 17,
                          padding: 12,
                          onTap: () {},
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(fontSize: 12),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, LoginRoutes.loginRoot);
                                },
                            ),
                          ],
                        ),
                      ),
                      const Spacer(flex: 6,),
                    ],
                  ),
                ),
                if (authState is ApiLoading)
                  const NetworkLoader(),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}

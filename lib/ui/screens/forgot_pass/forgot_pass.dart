import 'package:animation_wrappers/animations/faded_slide_animation.dart';
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
import '../../components/green_button.dart';
import '../../components/network_loader.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode submitBtnNode = FocusNode();
  bool _showErrorIcon = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final apiCubit = context.read<AuthApiCubit>();
    return BlocListener<AuthApiCubit, ApiState>(
      listener: (context, state) {
        if (state is ApiSuccessString) {
          if (state.data == 'TokenInput') {
            Navigator.pushNamed(context, LoginRoutes.onboardTokenInput);
          }
        }
      },
      child: Scaffold(
        body: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: BlocBuilder<AuthApiCubit, ApiState>(
            builder: (context, authState) => Scaffold(
              body: Stack(
                children: [
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
                                  child: Text("Forgot Password",
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
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            AuthInputField(
                              icon: 'assets/images/mail_ico.svg',
                              label: "Email",
                              height: screenHeight / 17,
                              controller: emailController,
                              focusNode: emailNode,
                              nextFocus: submitBtnNode,
                              onChanged: (String value) {
                                setState(() {
                                  _showErrorIcon = false;
                                }); },
                            ),
                            if (_showErrorIcon)
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          child: GreenButton(
                            height: screenHeight / 17,
                            padding: 12,
                            onTap: () {
                              if (emailController.text.isEmpty) {
                                setState(() {
                                  _showErrorIcon = true;
                                });
                              } else {
                                apiCubit.requestResetPassToken(emailController.text, context);
                              }
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

                  if (authState is ApiLoading)
                    const NetworkLoader(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

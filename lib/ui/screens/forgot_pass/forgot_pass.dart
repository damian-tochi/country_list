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

  @override
  Widget build(BuildContext context) {
    final apiCubit = context.read<AuthApiCubit>();
    return BlocListener<AuthApiCubit, ApiState>(
      listener: (context, state) {
        if (state is ApiSuccessString) {
          if (state.data == 'TokenInput') {
            Navigator.pushNamed(context, LoginRoutes.onboardTokenInput);
          }
        }
        if (state is ApiErrorMsg) {
          redFailedAlert(state.error, context);
        }
        if (state is ApiFailure) {
          redFailedAlert(state.failure, context);
          Navigator.pushNamed(context, LoginRoutes.onboardTokenInput);
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
                          padding: const EdgeInsets.only(
                              top: 80.0, left: 20, right: 20, bottom: 20),
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
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
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
                        AuthInputField(
                          icon: 'assets/images/mail_ico.svg',
                          label: "Email",
                          controller: emailController,
                          focusNode: emailNode,
                          nextFocus: submitBtnNode,
                          onChanged: (String value) {},
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          child: GreenButton(
                            onTap: () {
                              if (emailController.text.isEmpty) {
                                apiCubit.requestResetPassToken(emailController.text);
                              } else {
                                apiCubit.requestResetPassToken(emailController.text);
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

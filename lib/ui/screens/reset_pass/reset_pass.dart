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
import '../../components/auth_password_field.dart';
import '../../components/green_button.dart';
import '../../components/network_loader.dart';

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
    final apiCubit = context.read<AuthApiCubit>();

    return BlocListener<AuthApiCubit, ApiState>(
      listener: (context, state) {
        if (state is ApiSuccessString) {
          if (state.data == 'Login') {}
        }
        if (state is ApiErrorMsg) {
          redFailedAlert(state.error, context);
        }
        if (state is ApiFailure) {
          redFailedAlert(state.failure, context);
        }
        if (state is ApiErrorRegisterOnlyMsg) {
          redFailedAlert(state.error, context);
        }
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
                      AuthPasswordField(
                        label: "New Password",
                        controller: passwordController,
                        focusNode: passwordNode,
                        nextFocus: confirmPassNode,
                        onChanged: (String value) {},
                      ),
                      AuthPasswordField(
                        label: "Confirm New Password",
                        controller: confirmPassController,
                        focusNode: confirmPassNode,
                        nextFocus: submitBtnNode,
                        onChanged: (String value) {},
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        child: GreenButton(
                          onTap: () {
                            apiCubit.verifyResetPassData(passwordController.text, confirmPassController.text);
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

              ],),
            ),
          ),
        ),
      ),
    );
  }
}

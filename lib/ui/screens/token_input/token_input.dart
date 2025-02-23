import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/consts/app_icons.dart';
import '../../../Consts/global_func.dart';
import '../../../Routes/login_navigator.dart';
import '../../../Routes/routes.dart';
import '../../../Theme/colors.dart';
import '../../../data/cubits/auth_cubit.dart';
import '../../../data/helpers/api_state.dart';
import '../../components/alerts.dart';
import '../../components/green_button.dart';
import '../../components/network_loader.dart';
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
    final apiCubit = context.read<AuthApiCubit>();
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocListener<AuthApiCubit, ApiState>(
      listener: (context, state) {
        if (state is ApiSuccessString) {
          if (apiCubit.getTokenAction() == 1) {
            Navigator.pushNamed(context, LoginRoutes.onboardPasReset);
          }
          if (apiCubit.getTokenAction() == 0) {
            Navigator.popAndPushNamed(
              context,
              PageRoutes.appNavigation,
            );
          }
          if (state.data == 'Success') {
            Navigator.popAndPushNamed(context, LoginRoutes.loginRoot);
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
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: screenHeight / 12,
                              left: 5,
                              right: 20,
                              bottom: 20),
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
                                  top: 0,
                                  bottom: 0,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: SvgPicture.asset(
                                      AppIcons.back,
                                      width: 30.0,
                                      height: 25.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height / 21,
                        ),
                        SvgPicture.asset(
                          AppIcons.passCheckIcon,
                          width: 50.0,
                          height: 45.0,
                        ),
                        const Text(
                          "Enter the OTP that was sent to",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        ),
                        Text(
                          apiCubit.getEmail(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PinEntryTextField(
                          onSubmit: (String value) {},
                          pinController: _pinController,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: GreenButton(
                            padding: 12,
                            height: screenHeight / 17,
                            onTap: () {
                              if (_pinController.text.isNotEmpty) {
                                if (apiCubit.getTokenAction() == 1) {
                                  apiCubit.confirmToken(_pinController.text, context);
                                }
                                if (apiCubit.getTokenAction() == 0) {
                                  apiCubit.confirmSignUpToken(_pinController.text, context);
                                }
                              }
                            },
                            color: primaryColor,
                            label: 'Continue',
                            textColor: Colors.black,
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(fontSize: 12),
                            children: <TextSpan>[
                              const TextSpan(
                                text: "Didn't receive the code? ",
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextSpan(
                                text: 'Resend',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    if (apiCubit.getTokenAction() == 1) {
                                      apiCubit.resendRequestResetPassToken(apiCubit.getEmail(), context);
                                    }
                                    if (apiCubit.getTokenAction() == 0) {
                                      apiCubit.requestTokenWithEmail(apiCubit.getEmail(), context);
                                    }
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  if (authState is ApiLoading) const NetworkLoader(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

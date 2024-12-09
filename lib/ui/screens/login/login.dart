import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro_pay/data/helpers/api_state.dart';
import 'package:metro_pay/ui/components/alerts.dart';
import 'package:metro_pay/ui/components/google_button.dart';
import 'package:metro_pay/ui/components/network_loader.dart';
import '../../../Consts/global_func.dart';
import '../../../Routes/login_navigator.dart';
import '../../../Theme/colors.dart';
import '../../../data/cubits/auth_cubit.dart';
import '../../components/auth_input_field.dart';
import '../../components/auth_password_field.dart';
import '../../components/green_button.dart';
import 'login_interactor.dart';


class Login extends StatefulWidget {
  final LoginInteractor loginInteractor;

  const Login(this.loginInteractor, {super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode submitBtnNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool _showErrorIcon = false;


  @override
  Widget build(BuildContext context) {

    final apiCubit = context.read<AuthApiCubit>();

    return BlocListener<AuthApiCubit, ApiState>(
        listener: (context, state) {
      if (state is ApiSuccessString) {
        if (state.data == 'Login') {
          widget.loginInteractor.loginUser();
        }
      }
      if (state is ApiErrorMsg) {
        redFailedAlert(state.error, context);
      }
      if (state is ApiFailure) {
        redFailedAlert(state.failure, context);
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
                                child: Text("Log into your account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Positioned(
                                left: 0,
                                child: IconButton(
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
                            controller: emailController,
                            focusNode: emailNode,
                            nextFocus: passwordNode,
                            // onChanged: (String value) {
                            //   setState(() {
                            //     _showErrorIcon = false;
                            //   });
                            // },

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
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          AuthPasswordField(
                            label: "Password",
                            controller: passwordController,
                            focusNode: passwordNode,
                            nextFocus: submitBtnNode,
                            // onChanged: (String value) {
                            //   setState(() {
                            //   _showErrorIcon = false;
                            // }); },
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoginRoutes.forgotPassReset);
                            },
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        child: GreenButton(
                          onTap: () {
                            if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                              apiCubit.signInEmail(emailController.text, passwordController.text);
                            } else {
                              setState(() {
                                _showErrorIcon = true;
                              });
                            }
                          },
                          color: primaryColor,
                          label: 'Continue',
                          textColor: Colors.black,
                        ),
                      ),
                      const Text("or",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        child: GoogleButton(
                          onTap: () {
                            Navigator.pushNamed(context, LoginRoutes.onboardPasReset);
                          },
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(fontSize: 16),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Don’t have an account? ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: 'Create an account',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, LoginRoutes.signUpRoot);
                                },
                            ),
                          ],
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
    ),);
  }
}

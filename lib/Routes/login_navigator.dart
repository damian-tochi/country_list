import 'package:flutter/material.dart';
import 'package:metro_pay/Routes/routes.dart';
import 'package:metro_pay/ui/screens/forgot_pass/forgot_pass.dart';
import 'package:metro_pay/ui/screens/login/login.dart';
import 'package:metro_pay/ui/screens/reset_pass/reset_pass.dart';
import '../ui/screens/create_account/select_account_type.dart';
import '../ui/screens/login/login_page.dart';
import '../ui/screens/sign_up/sign_up.dart';
import '../ui/screens/start/start_ui.dart';
import '../ui/screens/token_input/token_input.dart';



GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LoginRoutes {
  static const String loginRoot = 'login/';
  static const String signUpRoot = 'signUp/';
  static const String prevLoggedIn = 'prevUser/';
  static const String welcomeLogIn = 'loginWelcomeUser/';
  static const String welcomeInfo = 'welcomeInfo/';
  static const String onboardTokenInput = 'input_token/';
  static const String onboardPasReset = 'resetPassPage/';
  static const String tokenExpired = 'tokenExpired/';
  static const String setTransactPin = 'setTransactionPin/';
  static const String confirmTransactPin = 'confirmTransactPin/';
  static const String createAccount = 'createAccount/';

  static const String forgotPassEmail = 'forgotPassEmail/';
  static const String forgotPassToken = 'forgotPassToken/';
  static const String forgotPassReset = 'forgotPassReset/';
}

class LoginNavigator extends StatelessWidget {
  LoginNavigator({super.key, required this.route});

  bool route;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: route == true ? LoginRoutes.welcomeLogIn : LoginRoutes.welcomeInfo,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case LoginRoutes.loginRoot:
              builder = (BuildContext _) => LoginPage(onLoginUser: () => Navigator.popAndPushNamed(
                context,
                PageRoutes.appNavigation,
              ),);
              break;
            case LoginRoutes.welcomeInfo:
              builder = (BuildContext _) => const StartUi();
              break;
            case LoginRoutes.signUpRoot:
              builder = (BuildContext _) => const SignUp();
              break;
            case LoginRoutes.welcomeLogIn:
              builder = (BuildContext _) => LoginPage(onLoginUser: () => Navigator.popAndPushNamed(
                context,
                PageRoutes.appNavigation,
              ),);
              break;
            case LoginRoutes.onboardTokenInput:
              builder = (BuildContext _) => const TokenInput();
              break;
            case LoginRoutes.forgotPassReset:
              builder = (BuildContext _) => const ForgotPassword();
              break;
            case LoginRoutes.onboardPasReset:
              builder = (BuildContext _) => const ResetPassword();
              break;
            case LoginRoutes.createAccount:
              builder = (BuildContext _) => const SelectAccountType();
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}

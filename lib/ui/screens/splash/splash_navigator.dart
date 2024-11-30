import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../Consts/global_func.dart';
import '../../../Routes/login_navigator.dart';



class SplashNavigator extends StatefulWidget {
  const SplashNavigator({super.key});


  @override
  _SplashNavigatorState createState() => _SplashNavigatorState();
}

class _SplashNavigatorState extends State<SplashNavigator> {

  @override
  void initState() {
    initialization();
    super.initState();

  }

  void initialization() async {
    _checkLoginStatus();
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    if (isLoggedIn == true) {
      ///User is logged in, navigate to Dashboard
      var sharedPreferences = await SharedPreferences.getInstance();
      if (sharedPreferences.getString("token") == null) {
        userLogin();
      } else {
        var tokenString = sharedPreferences.getString("token")!;
        var userID = sharedPreferences.getString("userID");
        userLogin();
      }

    } else {
      ///User is not logged in, navigate to Login
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginNavigator(route: false)),);
    }
  }

  void userLogin() {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginNavigator(route: true)),);
  }

  proceedToApp() {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AppNavigation()),);
  }

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
                    GlobalFunc.stringToMaterialColor("#E8E2F5"),
                    GlobalFunc.stringToMaterialColor("#FFFFFF"),
                  ],
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/group.svg',
                  width: 40,
                  height: 40,
                ),
              ),
            )
        )
    );
  }

}

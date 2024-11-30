import 'package:flutter/material.dart';
import 'package:metro_pay/ui/screens/splash/splash_navigator.dart';
import 'Routes/routes.dart';
import 'Theme/style.dart';


void main() {
  runApp(const MetroPay());
}


class MetroPay extends StatelessWidget {
  const MetroPay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home:const SplashNavigator(),
        routes: PageRoutes().routes(),
    );
  }
}

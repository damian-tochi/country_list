import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_pay/ui/screens/splash/splash_navigator.dart';
import 'Routes/routes.dart';
import 'Theme/style.dart';
import 'data/cubits/auth_cubit.dart';

void main() {
  runApp(const MetroPay());
}

class MetroPay extends StatelessWidget {
  const MetroPay({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthApiCubit>(
          create: (BuildContext context) => AuthApiCubit(),
        ),
      ],
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashNavigator(),
        routes: PageRoutes().routes(),
      ),
    );
  }
}

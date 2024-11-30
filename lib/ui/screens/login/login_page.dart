import 'package:flutter/material.dart';
import 'login.dart';
import 'login_interactor.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback onLoginUser;

  const LoginPage({super.key, required this.onLoginUser});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> implements LoginInteractor {
  @override
  Widget build(BuildContext context) {
    return Login(this);
  }

  @override
  void loginWithID(String isoCode, String mobileNumber) {
  }

  @override
  void loginUser() {
    widget.onLoginUser.call();
  }
}

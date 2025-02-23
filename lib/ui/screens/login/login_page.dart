import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Routes/login_navigator.dart';
import '../../../data/cubits/auth_cubit.dart';
import 'login.dart';
import 'login_interactor.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback onLoginUser;

  const LoginPage({super.key, required this.onLoginUser});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> implements LoginInteractor {

  // final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'profile'],);

  @override
  Widget build(BuildContext context) {
    return Login(this);
  }

  @override
  Future<void> loginWithGoogle() async {
    // try {
    //   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    //   final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    //
    //   final AuthCredential credential = GoogleAuthProvider.credential(
    //     accessToken: googleSignInAuthentication.accessToken,
    //     idToken: googleSignInAuthentication.idToken,
    //   );
    //
    //   final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    //   final User? user = userCredential.user;
    //
    //   try {
    //     String fullName = user!.displayName.toString();
    //     List<String> parts = fullName.split(RegExp(r'\s+'));
    //     String firstname = parts[0];
    //     String lastname = parts[1];
    //     loginWithGoogleCredentials(user.email.toString(), firstname, lastname, credential.accessToken.toString());
    //   } catch(f) {
    //     loginWithGoogleCredentials(user!.email.toString(), user.displayName.toString(), "", credential.accessToken.toString());
    //   }
    //
    //   if (kDebugMode) {
    //     print("${credential.accessToken} | ${user.email.toString()} | ${user.displayName.toString()}");
    //   }
    //
    // } catch (e) {
    //   if (mounted) {
    //     context.read<AuthApiCubit>().emitError(e.toString());
    //   }
    //   if (kDebugMode) {
    //     print(e.toString());
    //   }
    // }
  }

  void loginWithGoogleCredentials(String email, String firstName, String lastName, String accessToken) {
    context.read<AuthApiCubit>().signWithGoogle(email, firstName, lastName, accessToken);
  }


  @override
  void loginUser() {
    widget.onLoginUser.call();
  }

  @override
  void verifyUser() {
    Navigator.pushNamed(context, LoginRoutes.onboardTokenInput);
  }

  @override
  void createAccount() {
    Navigator.pushNamed(context, LoginRoutes.createAccount);
  }

}

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';


class AppApi {

  final client = Dio();
  static const baseUrl = "https://metropay-api.ourfutur.com/api/v1";
  var headerFree = {"content-type": "application/json"};


  ///Auth APIs *
  Future<Response> signUpNewUser(fName, lName, email, pass) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      "firstname": fName,
      "lastname": lName,
      "email": email,
      "password": pass
      // "email": "ditt0@yopmail.com",
      // "password": "password"
    };
    final response = await client.post('$baseUrl/auth/signup', data: data, options:Options(
      headers: headerFree,),);
    return response;
  }

  Future<Response> signInEmail(email, pass) async {
    client.interceptors.add(RetryInterceptor(
      dio: client,
      logPrint: print,
      retries: 2,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
    Map data = {
      'email': email,
      'password': pass,
    };
    final response = await client.post(
        '$baseUrl/auth/login',
        data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> logout() async {
    final response = await client.get('$baseUrl/auth/logout', options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> serverRequestEmailOTP(email) async {
    Map data = {
      'email': email,
    };
    final response = await client.post('$baseUrl/auth/resend-signup-otp', data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> serverVerifyEmailOTP(email, otp) async {
    Map data = {
      'email': email,
      'otp': otp,
    };
    final response = await client.post('$baseUrl/auth/verify-signup-email', data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> resetPassOTP(email) async {
    Map data = {
      'email': email,
    };
    final response = await client.post('$baseUrl/auth/initiate-password-reset', data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> resetPassOTPResend(email) async {
    Map data = {
      'email': email,
    };
    final response = await client.post('$baseUrl/auth/resend-reset-otp', data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> confirmResetPassEmail(email, otp) async {
    Map data = {
      'email': email,
      'otp': otp
    };
    final response = await client.post('$baseUrl/auth/confirm-reset-email', data: data, options:Options(
      headers: headerFree,));
    return response;
  }

  Future<Response> resetPasswordRequest(email, otp, password) async {
    Map data = {
      "resetToken": otp,
      "email": email,
      "password": password
    };
    final response = await client.post(
        '$baseUrl/auth/complete-password-reset', data: data, options: Options(
      headers: headerFree,));
    return response;
  }



}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../Consts/global_func.dart';
import '../../ui/components/alerts.dart';
import '../helpers/api_state.dart';
import '../models/sign_in_response.dart';
import '../models/verify_otp_response.dart';
import '../service/api_service.dart';


class AuthApiCubit extends Cubit<ApiState> {
  var verifyApi = AppApi();
  bool isRegisteredUserEmail = false;
  bool isRegisteredUsername = false;

  String username = '';
  String emailAddress = '';
  String password = '';
  String token = '';
  AccountData userData = AccountData();

  int authTokeAction = 0; //0 = Signup, 1 = PassReset

  AuthApiCubit() : super(ApiInitial());

  Future<void> signInEmail(String email, String pass, BuildContext context) async {
    emit(ApiLoading());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      Response response = await verifyApi.signInEmail(email, pass);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var formattedResponse = SignInResponse.fromJson(response.data);
        bool? hasVerifiedEmail = formattedResponse.content!.hasVerifiedEmail;
        if (hasVerifiedEmail != null && hasVerifiedEmail == false) {
          requestTokenWithEmail(formattedResponse.content!.email!, context);
        } else {
          Map<String, dynamic> innerMap = jsonDecode(formattedResponse.content!.token!);
          String accessToken = innerMap['accessToken'];
          String refreshToken = innerMap['refreshToken'];
          sharedPreferences.setString("Token", accessToken);
          sharedPreferences.setString("RefreshToken", refreshToken);
          userData = formattedResponse.content!.accountData!;
          if (context.mounted) {
            getUser(context);
            //greenSuccessAlert(accessToken, context);
          }
        }
        if (kDebugMode) {
          print(response);
        }

      } else {
        String msg = parseNetworkError(response);
        emit(ApiFailure(msg));
        if (context.mounted) {
          redFailedAlert(msg, context);
        }
      }
    } on DioException catch (e)  {
      if (e.response != null) {
        final errorMessage = e.response!.data['message'];
        redFailedAlert('$errorMessage', context);
      } else {
        redFailedAlert('Unexpected error: ${e.message}', context);
      }
      emit(ApiFailure('Request failed with error: $e'));
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> signWithGoogle(String email, String firstName, String lastName, String accessToken) async {

  }

  clearErrors() {
    emit(ApiInitial());
  }

  emitError(String err) {
    emit(ApiErrorMsg(err));
  }

  Future<void> verifyData(String fName, String lName, String email, String pass,
      String secondPassword, BuildContext c) async {
    if (fName.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Enter Firstname"));
    } else if (lName.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Enter Lastname"));
    } else if (email.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Enter Email"));
    } else if (pass.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Enter Password"));
    } else if (secondPassword.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Confirm Password"));
    } else {
      if (pass.compareTo(secondPassword) == 0) {
        signUpUser(fName, lName, email, pass, c);
      } else {
        emit(ApiErrorRegisterOnlyMsg("Passwords do not match"));
      }
    }
  }

  Future<void> signUpUser(String fName, String lName, String email, String pass, BuildContext context) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.signUpNewUser(fName, lName, email, pass);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emailAddress = email;
        emit(ApiSuccessString("Register"));
      } else {
        String msg = parseNetworkError(response);
        emit(ApiFailure(msg));
      }
    } on DioException catch (e)  {
      if (e.response != null) {
        final errorMessage = e.response!.data['message'];
        redFailedAlert('$errorMessage', context);
      } else {
        redFailedAlert('Unexpected error: ${e.message}', context);
      }
      emit(ApiFailure('Request failed with error: $e'));
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> requestTokenWithEmail(String email, BuildContext context) async {
    authTokeAction = 0;
    emit(ApiLoading());
    try {
      final response = await verifyApi.serverRequestEmailOTP(email);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emailAddress = email;
        emit(ApiSuccess(false));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
      if (kDebugMode) {
        print(response);
      }
    } on DioException catch (e)  {
      if (e.response != null) {
        final errorMessage = e.response!.data['message'];
        redFailedAlert('$errorMessage', context);
      } else {
        redFailedAlert('Unexpected error: ${e.message}', context);
      }
      emit(ApiFailure('Request failed with error: $e'));
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> requestToken() async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.serverRequestEmailOTP(emailAddress);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ApiSuccessString(emailAddress));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } on DioException catch (e)  {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> confirmSignUpToken(String token, BuildContext context) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.serverVerifyEmailOTP(emailAddress, token);
      if (response.statusCode == 200 || response.statusCode == 201) {
        VerifyOtpResponse resp = VerifyOtpResponse.fromJson(response.data);
        bool hasVerifiedEmail = resp.content!.hasVerifiedEmail!;
        if (hasVerifiedEmail) {
          emit(ApiSuccessString("Success"));
        }
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } on DioException catch (e)  {
      if (e.response != null) {
        final errorMessage = e.response!.data['message'];
        redFailedAlert('$errorMessage', context);
      } else {
        redFailedAlert('Unexpected error: ${e.message}', context);
      }
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> requestResetPassToken(email, BuildContext context) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.resetPassOTP(email);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ApiSuccessString('TokenInput'));
        emailAddress = email;
        authTokeAction = 1;
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } on DioException catch (e)  {
      if (e.response != null) {
        final errorMessage = e.response!.data['message'];
        redFailedAlert('$errorMessage', context);
      } else {
        redFailedAlert('Unexpected error: ${e.message}', context);
      }
      emit(ApiFailure('Request failed with error: $e'));
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> resendRequestResetPassToken(email, BuildContext context) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.serverRequestEmailOTP(email);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ApiSuccessString('TokenInput'));
        emailAddress = email;
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } on DioException catch (e)  {
      if (e.response != null) {
        final errorMessage = e.response!.data['message'];
        redFailedAlert('$errorMessage', context);
      } else {
        redFailedAlert('Unexpected error: ${e.message}', context);
      }
      emit(ApiFailure('Request failed with error: $e'));
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> confirmToken(String tokenTxt, BuildContext context) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.confirmResetPassEmail(emailAddress, tokenTxt);
      if (response.statusCode == 200 || response.statusCode == 201) {
        token = tokenTxt;
        emit(ApiSuccessString(emailAddress));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } on DioException catch (e)  {
      if (e.response != null) {
        final errorMessage = e.response!.data['message'];
        redFailedAlert('$errorMessage', context);
      } else {
        redFailedAlert('Unexpected error: ${e.message}', context);
      }
      emit(ApiFailure(''));
    }
  }

  Future<void> verifyResetPassData(String pass,
      String secondPassword) async {
    if (pass.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Enter Password"));
    } else if (secondPassword.isEmpty) {
      emit(ApiErrorRegisterOnlyMsg("Confirm Password"));
    } else {
      if (pass.compareTo(secondPassword) == 0) {
        resetPass(pass);
      } else {
        emit(ApiErrorRegisterOnlyMsg("Passwords do not match"));
      }
    }
  }

  Future<void> resetPass(String pass) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.resetPasswordRequest(emailAddress, token, pass);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ApiSuccessString(emailAddress));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } on DioException catch (e)  {
      if (e.response != null) {
        final errorMessage = e.response!.data['message'];
        emit(ApiFailure('$errorMessage'));
      } else {
        emit(ApiFailure('Unexpected error: ${e.message}'));
      }
    }
  }

  Future<void> getUser(BuildContext context) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.getUser();
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (userData.hasBankAccount == true) {
          emit(ApiSuccess(true));
        } else {
          emit(ApiSuccess(""));
        }
      } else {
        String msg = parseNetworkError(response);
        if (context.mounted) {
          redFailedAlert(msg, context);
        }
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
      if (kDebugMode) {
        print(response);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      if (context.mounted) {
        redFailedAlert('Request failed with error: $e', context);
      }
      emit(ApiSuccess(true));
      //emit(ApiFailure('Request failed with error: $e'));
    }
  }


  String getEmail() {
    return emailAddress;
  }

  int getTokenAction() {
    return authTokeAction;
  }


}


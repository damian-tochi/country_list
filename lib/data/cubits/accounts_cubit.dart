import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../Consts/global_func.dart';
import '../helpers/api_state.dart';
import '../service/api_service.dart';


class AccountsApiCubit extends Cubit<ApiState> {
  var verifyApi = AppApi();

  AccountsApiCubit() : super(ApiInitial());

  Future<void> createAccount(String bvn, String dob) async {
    emit(ApiLoading());
    try {
      Response response = await verifyApi.createBankingAccount(bvn, dob);
      if (response.statusCode == 200) {
        emit(ApiSuccess(response.data));
      } else {
        String msg = parseNetworkError(response);
        emit(ApiFailure(msg));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  clearErrors() {
    emit(ApiInitial());
  }

  emitError(String err) {
    emit(ApiErrorMsg(err));
  }

  Future<void> getAccounts(String id) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.getBankingAccount(id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        emit(ApiSuccessString(""));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }


}


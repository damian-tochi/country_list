import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../Consts/global_func.dart';
import '../helpers/api_state.dart';
import '../service/api_service.dart';


class BankingConfigApiCubit extends Cubit<ApiState> {
  var verifyApi = AppApi();

  BankingConfigApiCubit() : super(ApiInitial());


  Future<void> createTransactionPin(String transactionPin) async {
    emit(ApiLoading());
    try {
      Response response = await verifyApi.createAccTransactionPin(transactionPin);
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

  Future<void> verifyTransactionPin(String transactionPin) async {
    emit(ApiLoading());
    try {
      Response response = await verifyApi.verifyAccTransactionPin(transactionPin);
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

  Future<void> createTransactionBiometric(String transactionBiometric) async {
    emit(ApiLoading());
    try {
      Response response = await verifyApi.createAccBiometric(transactionBiometric);
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

  Future<void> verifyTransactionBiometric(String transactionBiometric) async {
    emit(ApiLoading());
    try {
      Response response = await verifyApi.verifyAccBiometric(transactionBiometric);
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

  Future<void> initPinChange() async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.initTransactionPinChange();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ApiSuccessString(""));
      } else {
        emit(ApiFailure(
            'Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> updateTransactionPinToken(String token, String newPin) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.updateTransactionPinToken(token, newPin);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        if (jsonResponse != null) {
          emit(ApiSuccessString(""));
        } else {
          emit(ApiErrorMsg(
              ""));
        }
      } else {
        emit(ApiFailure(
            'Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> updateExistingTransactionPin(String existingPin, String newPin) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.updateExistingTransactionPin(existingPin, newPin);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        emit(ApiSuccessString(jsonResponse));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> updateBiometric(String faceIdData, String newPin) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.updateBiometric(faceIdData, newPin);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        emit(ApiSuccessString(jsonResponse));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> updateAccTransactionLimit(String limit, String transactionPin, String biometricId) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.updateAccTransactionLimit(limit, transactionPin, biometricId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        emit(ApiSuccessString("Transaction limit updated successfully"));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }

  Future<void> updateTransactionApprovalMethod(String method, String transactionPin, String biometricId) async {
    emit(ApiLoading());
    try {
      final response = await verifyApi.updateTransactionApprovalMethod(method, transactionPin, biometricId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.data);
        emit(ApiSuccessString("Transaction approval method updated successfully"));
      } else {
        emit(ApiErrorMsg('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } catch (e) {
      emit(ApiFailure('Request failed with error: $e'));
    }
  }


}


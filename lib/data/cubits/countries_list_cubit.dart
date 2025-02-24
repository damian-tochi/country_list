import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../consts/global_func.dart';
import '../helpers/api_state.dart';
import '../models/countries_list_response.dart';
import '../service/api_service.dart';


class CountriesListCubit extends HydratedCubit<ApiState> {

  CountriesListCubit() : super(ApiInitial());

  var appApi = AppApi();
  List<CountriesListResponse> items = [];
  List<CountriesListResponse> filteredItems = [];

  void filterItems(String query) {
    if (query.isEmpty) {
      filteredItems = items;
      emit(ApiResult(items: filteredItems));
    } else {
      filteredItems = items.where((item) =>
              item.name!.official!.toLowerCase().contains(query.toLowerCase())).toList();
      emit(ApiResult(items: filteredItems));
    }
  }

  Future<void> getCountries() async {
    emit(ApiLoading());
    try {
      Response response = await appApi.getCountries();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final countriesListResponse =
            countriesListResponseFromJson(jsonEncode(response.data));
        items = countriesListResponse;
        filteredItems = items;
        emit(ApiResult(items: filteredItems));
      } else {
        String msg = parseNetworkError(response);
        emit(ApiFailure(failure: msg));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final errorMessage = e.response!.data['message'];
        emit(ApiFailure(failure: '$errorMessage'));
      } else {
        emit(ApiFailure(failure: 'Unexpected error: ${e.message}'));
      }
      emit(ApiFailure(failure: 'Request failed with error: $e'));
      if (kDebugMode) {
        print(e);
      }
    }
  }

  clearErrors() {
    emit(ApiInitial());
  }

  emitError(String err) {
    emit(ApiError(error: err));
  }

  @override
  ApiState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey("items")) {
      return ApiResult.fromJson(json);
    }
    return ApiInitial();
  }

  @override
  Map<String, dynamic>? toJson(ApiState state) {
    if (state is ApiResult) {
      return state.toJson();
    }
    return null;
  }

}

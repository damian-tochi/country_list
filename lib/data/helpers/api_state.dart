import '../models/countries_list_response.dart';
import '../models/country_response.dart';

abstract class ApiState {}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiSuccess extends ApiState {
  Map<String, dynamic> toJson() => {};
}

class ApiSuccessString extends ApiState {
  Map<String, dynamic> toJson() => {};
}

class ApiError extends ApiState {
  final String error;
  ApiError({required this.error});

  Map<String, dynamic> toJson() => {"error": error};

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(error: json["error"]);
  }
}

class ApiFailure extends ApiState {
  final String failure;
  ApiFailure({required this.failure});

  Map<String, dynamic> toJson() => {"failure": failure};

  factory ApiFailure.fromJson(Map<String, dynamic> json) {
    return ApiFailure(failure: json["failure"]);
  }
}

class ApiResult extends ApiState {
  final List<CountriesListResponse> items;
  ApiResult({required this.items});

  Map<String, dynamic> toJson() => {"items": items};

  factory ApiResult.fromJson(Map<String, dynamic> json) {
    return ApiResult(items: json["items"]);
  }
}

class ApiCountryResult extends ApiState {
  final List<CountryResp> result;
  ApiCountryResult({required this.result});

  Map<String, dynamic> toJson() => {"result": result};

  factory ApiCountryResult.fromJson(Map<String, dynamic> json) {
    return ApiCountryResult(result: json["result"]);
  }
}



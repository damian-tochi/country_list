
abstract class ApiState {}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiSuccess extends ApiState {
  final dynamic data;
  ApiSuccess(this.data);
}

class ApiSuccessString extends ApiState {
  final String data;
  ApiSuccessString(this.data);
}

class ApiErrorMsg extends ApiState {
  final String error;
  ApiErrorMsg(this.error);
}

class ApiFailure extends ApiState {
  final String failure;
  ApiFailure(this.failure);
}

class ApiErrorRegisterOnlyMsg extends ApiState {
  final String error;
  ApiErrorRegisterOnlyMsg(this.error);
}



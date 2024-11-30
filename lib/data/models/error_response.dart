
class ErrorResponse {
  final String developerMessage;
  final String httpStatusCode;
  final String defaultUserMessage;
  final String userMessageGlobalisationCode;
  final List<dynamic> errors;

  ErrorResponse({
    required this.developerMessage,
    required this.httpStatusCode,
    required this.defaultUserMessage,
    required this.userMessageGlobalisationCode,
    required this.errors,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      developerMessage: json['developerMessage'],
      httpStatusCode: json['httpStatusCode'],
      defaultUserMessage: json['defaultUserMessage'],
      userMessageGlobalisationCode: json['userMessageGlobalisationCode'],
      errors: json['errors'] ?? [],
    );
  }
}
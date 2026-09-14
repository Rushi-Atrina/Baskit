/// Normalized error thrown by [DummyJsonApi] / [ApiClient] so callers
/// (SyncRepository, later controllers) don't need to know about Dio.
/// Maps to requirements.md "Error Handling" §No Internet / API Failure.
sealed class ApiException implements Exception {
  const ApiException(this.message);

  final String message;
}

class NoInternetException extends ApiException {
  const NoInternetException()
      : super('Internet connection required for setup.');
}

class ApiFailureException extends ApiException {
  const ApiFailureException([super.message = 'Something went wrong.']);
}

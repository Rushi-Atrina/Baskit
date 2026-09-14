import 'package:dio/dio.dart';

import 'api_exception.dart';

/// Shared Dio instance. Only [DummyJsonApi] (called from SyncRepository)
/// uses this — see docs/architecture.md §1: screens never call the API.
class ApiClient {
  ApiClient({Dio? dio})
      : dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://dummyjson.com',
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 15),
              ),
            );

  final Dio dio;

  /// Wraps a Dio call, translating connectivity/timeout/server errors into
  /// [ApiException] subtypes the rest of the app understands.
  Future<T> guard<T>(Future<T> Function(Dio dio) request) async {
    try {
      return await request(dio);
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
          throw const NoInternetException();
        default:
          throw ApiFailureException(e.message ?? 'Something went wrong.');
      }
    }
  }
}

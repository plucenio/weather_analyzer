import 'package:dio/dio.dart';

import 'http.dart';

/// HttpClient adapter for Dio.
///
/// This adapter is used to interface with the Dio package to make HTTP requests.
/// It provides a concrete implementation of the IHttpClient interface for Dio,
/// allowing for easy swapping of HTTP clients if needed.
///
/// Example usage:
/// ```dart
/// final httpClient = HttpClient(dio: Dio());
/// final response = await httpClient.get<String>('https://api.example.com/data');
///
class HttpClient implements IHttpClient {
  final Dio dio;

  const HttpClient({required this.dio});

  @override
  Future<Response<T>> get<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
  }) async {
    final response = await dio.get<T>(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }
}

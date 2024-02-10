import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future<Response> get(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
  });
}

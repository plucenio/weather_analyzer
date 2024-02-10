import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future<Response> get(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
  });
}

class HttpClient implements IHttpClient {
  final Dio dio;

  const HttpClient({required this.dio});

  @override
  Future<Response> get(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
  }) async {
    final response = await dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }
}

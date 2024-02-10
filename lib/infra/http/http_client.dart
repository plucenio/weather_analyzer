import 'package:dio/dio.dart';

import 'http.dart';

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

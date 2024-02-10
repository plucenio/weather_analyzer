import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_analyzer/presentation/presentation.dart';
import 'lib.dart';

class AppModule extends Module {
  @override
  void binds(final i) {
    i.add<IHttpClient>(
      () => HttpClient(
          dio: Dio(
        BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5/'),
      )),
    );
  }

  @override
  void routes(final r) {
    r.module('/', module: HomeModule());
  }
}

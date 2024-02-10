import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'lib.dart';

class AppModule extends Module {
  @override
  void binds(final i) {
    //TODO: adicionar injeção do IHttpClient
    i.add<IOpenWeatherMapDatasource>(
      () => OpenWeatherMapDatasource(
        httpClient: HttpClient(
            dio: Dio(
          BaseOptions(baseUrl: 'https://api.openweathermap.org/data/2.5/'),
        )),
      ),
    );
  }

  @override
  void routes(final r) {
    r.child('/', child: (final context) => const HomePage());
  }
}

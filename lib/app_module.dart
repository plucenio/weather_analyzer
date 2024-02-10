import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'lib.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    //TODO: to create an adapter to Dio.
    i.add<IOpenWeatherMapDatasource>(
        () => OpenWeatherMapDatasource(dio: Dio()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_analyzer/data/repositories/weather_analyser_repository.dart';
import 'package:weather_analyzer/domain/repositories/repositories.dart';

import '../../lib.dart';
import 'home.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(final i) {
    i.add<IOpenWeatherMapDatasource>(
      () => OpenWeatherMapDatasource(
        httpClient: i.get(),
      ),
    );
    i.add<IWeatherAnalyserRepository>(
      () => WeatherAnalyserResporitory(
        openWeatherMapDatasource: i.get(),
      ),
    );
  }

  @override
  void routes(final r) {
    r.child('/', child: (final context) => const HomePage());
  }
}

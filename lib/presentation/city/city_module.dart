import 'package:flutter_modular/flutter_modular.dart';
import '../../lib.dart';

class CityModule extends Module {
  @override
  List<Module> get imports => [BaseModule()];

  @override
  void binds(final i) {
    i.add<IOpenWeatherMapDatasource>(
      () => OpenWeatherMapDatasource(
        httpClient: i.get(),
      ),
    );
    i.addSingleton<IWeatherAnalyzerRepository>(
      () => WeatherAnalyzerRepository(
        openWeatherMapDatasource: i.get<IOpenWeatherMapDatasource>(),
      ),
    );
    i.addSingleton<IGetCurrentWeatherByLocation>(
      () => GetCurrentWeatherByLocation(
        weatherAnalyzerRepository: i.get<IWeatherAnalyzerRepository>(),
      ),
    );
    i.addSingleton<IGetForecastWeatherByLocation>(
      () => GetForecastWeatherByLocation(
        weatherAnalyzerRepository: i.get<IWeatherAnalyzerRepository>(),
      ),
    );
    i.addLazySingleton<IGetWeatherImageUri>(
      () => GetWeatherImageUri(),
    );
    i.add<CityPageViewmodel>(
      () => CityPageViewmodel(
        getCurrentWeatherByLocation: i.get<IGetCurrentWeatherByLocation>(),
        getForecastWeatherByLocation: i.get<IGetForecastWeatherByLocation>(),
        getWeatherImageUri: i.get<IGetWeatherImageUri>(),
      ),
    );
  }

  @override
  void routes(final r) {
    r.child('/',
        child: (final context) => CityPage(
              city: r.args.data,
            ));
  }
}

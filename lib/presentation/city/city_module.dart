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
    i.addSingleton<IWeatherAnalyserRepository>(
      () => WeatherAnalyserResporitory(
        openWeatherMapDatasource: i.get<IOpenWeatherMapDatasource>(),
      ),
    );
    i.addSingleton<IGetCurrentWeatherByLocation>(
      () => GetCurrentWeatherByLocation(
        weatherAnalyserRepository: i.get<IWeatherAnalyserRepository>(),
      ),
    );
    i.addSingleton<IGetForecastWeatherByLocation>(
      () => GetForecastWeatherByLocation(
        weatherAnalyserRepository: i.get<IWeatherAnalyserRepository>(),
      ),
    );
    i.addSingleton<CityPageViewmodel>(
      () => CityPageViewmodel(),
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

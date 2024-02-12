import 'package:flutter_modular/flutter_modular.dart';
import '../../lib.dart';

class HomeModule extends Module {
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
    i.addSingleton<HomePageViewmodel>(
      () => HomePageViewmodel(
        getCities: i.get<IGetCities>(),
      ),
    );
    i.addSingleton<IReaderDatasource>(
      () => ReaderDatasource(),
    );
    i.addSingleton<ICitiesConfigurationRepository>(
      () => CitiesConfigurationRespository(
        readerDatasource: i.get<IReaderDatasource>(),
      ),
    );
    i.addSingleton<IGetCities>(
      () => GetCities(
        citiesConfigurationRepository: i.get<ICitiesConfigurationRepository>(),
      ),
    );
  }

  @override
  void routes(final r) {
    r.child('/', child: (final context) => const HomePage());
  }
}

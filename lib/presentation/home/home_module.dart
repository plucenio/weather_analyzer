import 'package:flutter_modular/flutter_modular.dart';
import '../../lib.dart';

class HomeModule extends Module {
  static const String city = '/city';

  @override
  List<Module> get imports => [BaseModule()];

  @override
  void binds(final i) {
    i.addSingleton<IRootBundleAdapter>(
      () => RootBundleAdapter(),
    );
    i.addSingleton<IFileReaderDatasource>(
      () => FileReaderDatasource(
        rootBundleAdapter: i.get<IRootBundleAdapter>(),
      ),
    );
    i.addSingleton<ICitiesConfigurationRepository>(
      () => CitiesConfigurationRespository(
        readerDatasource: i.get<IFileReaderDatasource>(),
      ),
    );
    i.addSingleton<IGetCities>(
      () => GetCities(
        citiesConfigurationRepository: i.get<ICitiesConfigurationRepository>(),
      ),
    );
    i.add<HomePageViewmodel>(
      () => HomePageViewmodel(
        getCities: i.get<IGetCities>(),
      ),
    );
  }

  @override
  void routes(final r) {
    r.child('/', child: (final context) => const HomePage());
    r.module(city, module: CityModule());
  }
}

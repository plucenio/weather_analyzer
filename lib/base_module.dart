import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'lib.dart';

class BaseModule extends Module {
  static const String homeModule = '/home';

  @override
  void binds(final i) {
    i.add<IHttpClient>(
      () => HttpClient(
          dio: Dio(
        BaseOptions(baseUrl: BASE_URL),
      )),
    );
    i.addSingleton<IAdaptativeSizer>(
      AdaptativeSizer.instance,
    );
  }

  @override
  void routes(final r) {
    r.child('/', child: (final _) => const SplashPage());
    r.module(homeModule, module: HomeModule());
  }
}

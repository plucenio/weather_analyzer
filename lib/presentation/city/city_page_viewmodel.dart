import 'package:dartz/dartz.dart';

import '../../lib.dart';

class CityPageViewmodel extends ViewModel<CityPageState> {
  final IGetCurrentWeatherByLocation getCurrentWeatherByLocation;
  final IGetForecastWeatherByLocation getForecastWeatherByLocation;
  final IGetWeatherImageUri getWeatherImageUri;
  CityPageViewmodel({
    required this.getCurrentWeatherByLocation,
    required this.getForecastWeatherByLocation,
    required this.getWeatherImageUri,
  }) : super(const CityPageLoadingState());

  void fetchData({required final City city}) async {
    emit(const CityPageLoadingState());
    final futures = await Future.wait([
      getCurrentWeatherByLocation.call(
          location: Location(lat: city.lat, lon: city.lng)),
      getForecastWeatherByLocation.call(
          location: Location(lat: city.lat, lon: city.lng)),
    ]);

    (futures[0] as Either<Failure, CurrentWeatherResponse>).fold(
        (final l) => emit(
              const CityPageErrorState(errorMessage: 'An error has ocurred.'),
            ), (final r) {
      final icon = getWeatherImageUri.call(r.weather?.first.icon ?? '');
      emit(
        CityPageDataState(
          temperature: r.main?.temp.toString() ?? '',
          icon: icon,
        ),
      );
    });
  }
}

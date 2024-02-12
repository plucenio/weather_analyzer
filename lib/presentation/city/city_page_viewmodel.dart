import 'package:dartz/dartz.dart';

import '../../lib.dart';

class CityPageViewmodel extends ViewModel<CityPageState> {
  final IGetCurrentWeatherByLocation getCurrentWeatherByLocation;
  final IGetForecastWeatherByLocation getForecastWeatherByLocation;
  CityPageViewmodel({
    required this.getCurrentWeatherByLocation,
    required this.getForecastWeatherByLocation,
  }) : super(const CityPageLoadingState());

  void fetchData({required final City city}) async {
    final futures = await Future.wait([
      getCurrentWeatherByLocation.call(
          location: Location(lat: city.lat, lon: city.lng)),
      getForecastWeatherByLocation.call(
          location: Location(lat: city.lat, lon: city.lng)),
    ]);

    (futures[0] as Either<Failure, CurrentWeatherResponse>).fold(
      (final l) => emit(
        const CityPageErrorState(errorMessage: 'An error has ocurred.'),
      ),
      (final r) => emit(
        CityPageDataState(temperature: r.main?.temp.toString() ?? ''),
      ),
    );
  }
}

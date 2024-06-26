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
    final currentWeather = _fetchCurrentWeather(
      future: futures[0] as Either<Failure, CurrentWeatherResponse>,
    );
    final forecast = _fetchForecastWeather(
      future: futures[1] as Either<Failure, ForecastWeatherResponse>,
    );
    if (currentWeather != null && forecast.isNotEmpty) {
      emit(CityPageDataState(
        currentWeather: currentWeather,
        forecastWeather: forecast,
      ));
      return;
    }
    emit(const CityPageErrorState(errorMessage: 'Error on fetch data'));
  }

  Weather? _fetchCurrentWeather(
      {required final Either<Failure, CurrentWeatherResponse> future}) {
    return future.fold((final l) => null, (final r) {
      if (r.weather != null) {
        final icon = getWeatherImageUri.call(r.weather?.first.icon ?? '');
        final temperature = r.main?.temp ?? '0';
        return r.weather?.first.copyWith(
          icon: icon,
          temperature: temperature,
        );
      }
      return null;
    });
  }

  List<Weather> _fetchForecastWeather(
      {required final Either<Failure, ForecastWeatherResponse> future}) {
    return future.fold((final l) => [], (final r) {
      if (r.list != null) {
        final forecast = r.list
                ?.map(
                  (final e) => e.weather!.first.copyWith(
                    icon: getWeatherImageUri.call(
                      e.weather!.first.icon ?? '',
                    ),
                    dateTime:
                        '${DateTime.fromMillisecondsSinceEpoch((e.dt ?? 0) * 1000).month.toString().padLeft(2, '0')}/${DateTime.fromMillisecondsSinceEpoch((e.dt ?? 0) * 1000).day.toString().padLeft(2, '0')} ${DateTime.fromMillisecondsSinceEpoch((e.dt ?? 0) * 1000).hour.toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch((e.dt ?? 0) * 1000).minute.toString().padLeft(2, '0')}',
                  ),
                )
                .toList() ??
            [];
        return forecast;
      }
      return [];
    });
  }
}

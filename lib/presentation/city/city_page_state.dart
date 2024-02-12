import '../../lib.dart';

abstract class CityPageState extends ViewModelState {
  const CityPageState();
}

class CityPageLoadingState extends CityPageState {
  const CityPageLoadingState();
}

class CityPageDataState extends CityPageState {
  final Weather currentWeather;
  final String icon;
  const CityPageDataState({
    required this.currentWeather,
    required this.icon,
  });
}

class CityPageErrorState extends CityPageState {
  final String errorMessage;
  const CityPageErrorState({required this.errorMessage});
}

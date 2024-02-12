import '../../lib.dart';

abstract class CityPageState extends ViewModelState {
  const CityPageState();
}

class CityPageLoadingState extends CityPageState {
  const CityPageLoadingState();
}

class CityPageDataState extends CityPageState {
  final String temperature;
  const CityPageDataState({required this.temperature});
}

class CityPageErrorState extends CityPageState {
  final String errorMessage;
  const CityPageErrorState({required this.errorMessage});
}

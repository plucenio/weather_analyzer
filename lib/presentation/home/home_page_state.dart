import '../../lib.dart';

abstract class HomePageState extends ViewModelState {
  const HomePageState();
}

class HomePageLoadingState extends HomePageState {
  const HomePageLoadingState();
}

class HomePageDataState extends HomePageState {
  final List<City> cities;
  final List<City> filteredCities;
  const HomePageDataState({required this.cities, required this.filteredCities});
}

class HomePageErrorState extends HomePageState {
  final String errorMessage;
  const HomePageErrorState({required this.errorMessage});
}

import '../../lib.dart';

class HomePageViewmodel extends ViewModel<HomePageState> {
  final IGetCities getCities;

  HomePageViewmodel({
    required this.getCities,
  }) : super(const HomePageLoadingState());

  @override
  void initViewModel() async {
    super.initViewModel();
    emit(const HomePageLoadingState());
    final value = await getCities.call();
    final cities = value.fold(
      (final l) => <City>[],
      (final r) => r,
    );

    cities.isNotEmpty
        ? emit(HomePageDataState(cities: cities, filteredCities: cities))
        : emit(const HomePageErrorState(errorMessage: 'An error has ocurred.'));
  }

  void filter(final String filter) {
    final newState = switch (state) {
      HomePageDataState(
        cities: final cities,
      ) =>
        HomePageDataState(
            cities: cities,
            filteredCities: cities
                .where((final element) =>
                    (element.name ?? '').contains(filter) ||
                    (element.country ?? '').contains(filter))
                .toList()),
      (_) => const HomePageErrorState(errorMessage: 'An error has ocurred.'),
    };
    emit(newState);
  }
}

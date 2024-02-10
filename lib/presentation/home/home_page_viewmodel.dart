import '../../lib.dart';

class HomePageViewmodel extends ViewModel<HomePageState> {
  final IGetCurrentWeatherByLocation getCurrentWeatherByLocation;

  HomePageViewmodel({
    required this.getCurrentWeatherByLocation,
  }) : super(const HomePageLoadingState());

  @override
  void initViewModel() async {
    super.initViewModel();

    //TODO: remover este codigo
    final value2 = await DM.get<IGetCities>().call();
    print(value2);

    emit(const HomePageLoadingState());
    final value = await getCurrentWeatherByLocation.call();
    final result = value.fold(
      (final l) => false,
      (final r) => true,
    );

    result
        ? emit(const HomePageDataState())
        : emit(const HomePageErrorState(errorMessage: 'An error was ocurred.'));
  }
}

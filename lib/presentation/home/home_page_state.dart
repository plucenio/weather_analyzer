import '../../lib.dart';

abstract class HomePageState extends ViewModelState {
  const HomePageState();
}

class HomePageLoadingState extends HomePageState {
  const HomePageLoadingState();
}

class HomePageDataState extends HomePageState {
  const HomePageDataState();
}

class HomePageErrorState extends HomePageState {
  final String errorMessage;
  const HomePageErrorState({required this.errorMessage});
}

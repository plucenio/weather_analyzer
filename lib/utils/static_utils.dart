// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import '../lib.dart';

///
/// Provides a static access to a singleton that implements [Navigation]
///
final INavigation Nav = ModularNavigation.i();

///
/// Provides a static access to a singleton that implements [DependencyManager]
///
final IDependencyManager DM = ModularDependencyManager.i();

///
/// `BASE_URL` is the base URL for the OpenWeatherMap API where all the API requests start.
///
const String BASE_URL = 'https://api.openweathermap.org/data/2.5/';

///
/// `API_KEY` is the unique API key for accessing the OpenWeatherMap API services.
/// It is used to authenticate requests to the API.
///
const String API_KEY = '81ee26cd0ef525be11a625fac41650cf';

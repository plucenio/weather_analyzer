abstract class IGetWeatherImageUri {
  String call(final String code);
}

class GetWeatherImageUri implements IGetWeatherImageUri {
  @override
  String call(final String code) {
    if (code.isEmpty) {
      return '';
    }
    return 'https://openweathermap.org/img/wn/$code@2x.png';
  }
}

abstract class IGetWeatherImageUri {
  String call(final String code);
}

class GetWeatherImageUri implements IGetWeatherImageUri {
  @override
  String call(final String code) {
    if (code.isEmpty) {
      //TODO: tratar um fallback
      return 'https://openweathermap.org/img/wn/01d@2x.png';
    }
    return 'https://openweathermap.org/img/wn/$code@2x.png';
  }
}

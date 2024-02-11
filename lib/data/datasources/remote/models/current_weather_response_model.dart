import '../../../../domain/domain.dart';
import 'models.dart';

class CurrentWeatherResponseModel {
  CoordModel? coord;
  List<WeatherModel>? weather;
  String? base;
  MainModel? main;
  int? visibility;
  WindModel? wind;
  RainModel1h? rain;
  CloudsModel? clouds;
  int? dt;
  CurrentSysModel? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeatherResponseModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.rain,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  CurrentWeatherResponseModel.fromJson(final Map<String, dynamic> json) {
    coord = json['coord'] != null ? CoordModel.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <WeatherModel>[];
      json['weather'].forEach((final v) {
        weather!.add(WeatherModel.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? MainModel.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? WindModel.fromJson(json['wind']) : null;
    rain = json['rain'] != null ? RainModel1h.fromJson(json['rain']) : null;
    clouds =
        json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? CurrentSysModel.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((final v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }

  CurrentWeatherResponse toEntity() {
    return CurrentWeatherResponse(
      coord: coord?.toEntity(),
      weather: weather?.map((final e) => e.toEntity()).toList(),
      base: base,
      main: main?.toEntity(),
      visibility: visibility,
      wind: wind?.toEntity(),
      rain: rain?.toEntity(),
      clouds: clouds?.toEntity(),
      dt: dt,
      sys: sys?.toEntity(),
      timezone: timezone,
      id: id,
      name: name,
      cod: cod,
    );
  }
}

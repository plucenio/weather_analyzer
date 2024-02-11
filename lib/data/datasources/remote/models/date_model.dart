import 'package:weather_analyzer/lib.dart';

class DateModel {
  int? dt;
  MainModel? main;
  List<WeatherModel>? weather;
  CloudsModel? clouds;
  WindModel? wind;
  int? visibility;
  String? pop;
  RainModel3h? rain;
  ForecastSysModel? sys;
  String? dtTxt;

  DateModel(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.rain,
      this.sys,
      this.dtTxt});

  DateModel.fromJson(final Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? MainModel.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <WeatherModel>[];
      json['weather'].forEach((final v) {
        weather!.add(WeatherModel.fromJson(v));
      });
    }
    clouds =
        json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? WindModel.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'].toString();
    rain = json['rain'] != null ? RainModel3h.fromJson(json['rain']) : null;
    sys = json['sys'] != null ? ForecastSysModel.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((final v) => v.toJson()).toList();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['visibility'] = visibility;
    data['pop'] = pop;
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['dt_txt'] = dtTxt;
    return data;
  }

  Date toEntity() {
    return Date(
      dt: dt,
      main: main?.toEntity(),
      weather: weather?.map((final e) => e.toEntity()).toList(),
      clouds: clouds?.toEntity(),
      wind: wind?.toEntity(),
      visibility: visibility,
      pop: pop,
      rain: rain?.toEntity(),
      sys: sys?.toEntity(),
      dtTxt: dtTxt,
    );
  }
}

import '../../../../domain/domain.dart';

class CurrentWeatherResponseModel {
  CoordModel? coord;
  List<WeatherModel>? weather;
  String? base;
  MainModel? main;
  int? visibility;
  WindModel? wind;
  RainModel? rain;
  CloudsModel? clouds;
  int? dt;
  SysModel? sys;
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
    rain = json['rain'] != null ? RainModel.fromJson(json['rain']) : null;
    clouds =
        json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? SysModel.fromJson(json['sys']) : null;
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

class CoordModel {
  double? lon;
  double? lat;

  CoordModel({this.lon, this.lat});

  CoordModel.fromJson(final Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }

  Coord toEntity() {
    return Coord(
      lon: lon,
      lat: lat,
    );
  }
}

class WeatherModel {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  WeatherModel.fromJson(final Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }

  Weather toEntity() {
    return Weather(
      id: id,
      main: main,
      description: description,
      icon: icon,
    );
  }
}

class MainModel {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  MainModel(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel});

  MainModel.fromJson(final Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    return data;
  }

  Main toEntity() {
    return Main(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      humidity: humidity,
      seaLevel: seaLevel,
      grndLevel: grndLevel,
    );
  }
}

class WindModel {
  double? speed;
  int? deg;
  double? gust;

  WindModel({this.speed, this.deg, this.gust});

  WindModel.fromJson(final Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }

  Wind toEntity() {
    return Wind(
      speed: speed,
      deg: deg,
      gust: gust,
    );
  }
}

class RainModel {
  double? d1h;

  RainModel({this.d1h});

  RainModel.fromJson(final Map<String, dynamic> json) {
    d1h = json['1h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1h'] = d1h;
    return data;
  }

  Rain toEntity() {
    return Rain(
      d1h: d1h,
    );
  }
}

class CloudsModel {
  int? all;

  CloudsModel({this.all});

  CloudsModel.fromJson(final Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }

  Clouds toEntity() {
    return Clouds(
      all: all,
    );
  }
}

class SysModel {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  SysModel({this.type, this.id, this.country, this.sunrise, this.sunset});

  SysModel.fromJson(final Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }

  Sys toEntity() {
    return Sys(
      type: type,
      id: id,
      country: country,
      sunrise: sunrise,
      sunset: sunset,
    );
  }
}

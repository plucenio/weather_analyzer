import '../../../../lib.dart';

class CityResponseModel {
  int? id;
  String? name;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  CityResponseModel(
      {this.id,
      this.name,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  CityResponseModel.fromJson(final Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }

  CityResponse toEntity() {
    return CityResponse(
      id: id,
      name: name,
      country: country,
      population: population,
      timezone: timezone,
      sunrise: sunrise,
      sunset: sunset,
    );
  }
}

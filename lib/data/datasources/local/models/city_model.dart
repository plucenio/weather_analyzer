import '../../../../lib.dart';

class CitiesModel {
  List<CityModel>? cities;

  CitiesModel({this.cities});

  CitiesModel.fromJson(final Map<String, dynamic> json) {
    if (json['data'] != null) {
      cities = <CityModel>[];
      json['data'].forEach((final v) {
        cities!.add(CityModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cities != null) {
      data['data'] = cities!.map((final v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityModel {
  String? name;
  String? country;
  String? lat;
  String? lng;

  CityModel({this.name, this.country, this.lat, this.lng});

  CityModel.fromJson(final Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['country'] = country;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }

  City toEntity() {
    return City(
      name: name,
      country: country,
      lat: lat,
      lng: lng,
    );
  }
}

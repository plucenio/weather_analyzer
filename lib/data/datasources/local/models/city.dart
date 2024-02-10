class Cities {
  List<City>? cities;

  Cities({this.cities});

  Cities.fromJson(final Map<String, dynamic> json) {
    if (json['data'] != null) {
      cities = <City>[];
      json['data'].forEach((final v) {
        cities!.add(City.fromJson(v));
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

class City {
  String? name;
  String? country;
  String? lat;
  String? lng;
  //TODO: adicionar imagem

  City({this.name, this.country, this.lat, this.lng});

  City.fromJson(final Map<String, dynamic> json) {
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
}

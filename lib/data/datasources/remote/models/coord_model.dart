import '../../../../lib.dart';

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

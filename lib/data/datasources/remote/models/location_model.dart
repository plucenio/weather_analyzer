import '../../../../lib.dart';

class LocationModel {
  String? lat;
  String? lon;

  LocationModel({this.lat, this.lon});

  factory LocationModel.fromEntity(final Location entity) {
    return LocationModel(
      lat: entity.lat,
      lon: entity.lon,
    );
  }
}

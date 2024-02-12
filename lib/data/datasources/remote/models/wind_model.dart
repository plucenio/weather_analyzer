import '../../../../lib.dart';

class WindModel {
  String? speed;
  int? deg;
  String? gust;

  WindModel({this.speed, this.deg, this.gust});

  WindModel.fromJson(final Map<String, dynamic> json) {
    speed = json['speed'].toString();
    deg = json['deg'];
    gust = json['gust'].toString();
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

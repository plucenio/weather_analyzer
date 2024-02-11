import '../../../../lib.dart';

class RainModel1h {
  double? d1h;

  RainModel1h({this.d1h});

  RainModel1h.fromJson(final Map<String, dynamic> json) {
    d1h = json['1h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1h'] = d1h;
    return data;
  }

  Rain1h toEntity() {
    return Rain1h(
      d1h: d1h,
    );
  }
}

class RainModel3h {
  double? d3h;

  RainModel3h({this.d3h});

  RainModel3h.fromJson(final Map<String, dynamic> json) {
    d3h = json['3h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3h'] = d3h;
    return data;
  }

  Rain3h toEntity() {
    return Rain3h(
      d3h: d3h,
    );
  }
}

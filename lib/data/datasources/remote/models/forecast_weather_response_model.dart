import '../../../../lib.dart';

class ForecastWeatherResponseModel {
  String? cod;
  int? message;
  int? cnt;
  List<DateModel>? list;
  CityResponseModel? city;

  ForecastWeatherResponseModel(
      {this.cod, this.message, this.cnt, this.list, this.city});

  ForecastWeatherResponseModel.fromJson(final Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <DateModel>[];
      json['list'].forEach((final v) {
        list!.add(DateModel.fromJson(v));
      });
    }
    city =
        json['city'] != null ? CityResponseModel.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list!.map((final v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }

  ForecastWeatherResponse toEntity() {
    return ForecastWeatherResponse(
      cod: cod,
      message: message,
      cnt: cnt,
      list: list?.map((final v) => v.toEntity()).toList(),
      city: city?.toEntity(),
    );
  }
}

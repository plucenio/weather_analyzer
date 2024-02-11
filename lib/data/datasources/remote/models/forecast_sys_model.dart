import '../../../../lib.dart';

class ForecastSysModel {
  String? pod;

  ForecastSysModel({this.pod});

  ForecastSysModel.fromJson(final Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pod'] = pod;
    return data;
  }

  ForecastSys toEntity() {
    return ForecastSys(pod: pod);
  }
}

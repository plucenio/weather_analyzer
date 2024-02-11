import '../../../../lib.dart';

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

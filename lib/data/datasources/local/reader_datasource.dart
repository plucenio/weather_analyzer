import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'local.dart';

abstract class IReaderDatasource {
  Future<List<CityModel>> readCities();
}

class ReaderDatasource implements IReaderDatasource {
  @override
  Future<List<CityModel>> readCities() async {
    final result = await rootBundle.loadString('assets/cities.json');
    final cities = CitiesModel.fromJson(jsonDecode(result));
    if (cities.cities != null) {
      return cities.cities!;
    }
    return [];
  }
}

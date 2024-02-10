import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'local.dart';

abstract class IReaderDatasource {
  Future<List<City>> readCities();
}

class ReaderDatasource implements IReaderDatasource {
  @override
  Future<List<City>> readCities() async {
    final result = await rootBundle.loadString('assets/cities.json');
    final cities = Cities.fromJson(jsonDecode(result));
    if (cities.cities != null) {
      return cities.cities!;
    }
    return [];
  }
}

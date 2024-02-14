import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'local.dart';

abstract class IRootBundleAdapter {
  Future<String> loadString({required final String key});
}

class RootBundleAdapter {
  Future<String> loadString({required final String key}) async {
    return await rootBundle.loadString(key);
  }
}

abstract class IFileReaderDatasource {
  Future<List<CityModel>> readCities();
}

class FileReaderDatasource implements IFileReaderDatasource {
  final IRootBundleAdapter rootBundleAdapter;

  FileReaderDatasource({required this.rootBundleAdapter});

  @override
  Future<List<CityModel>> readCities() async {
    final result =
        await rootBundleAdapter.loadString(key: 'assets/cities.json');
    final cities = CitiesModel.fromJson(jsonDecode(result));
    if (cities.cities != null) {
      return cities.cities!;
    }
    return [];
  }
}

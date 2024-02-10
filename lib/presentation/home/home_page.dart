import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_analyzer/lib.dart';
import 'package:weather_analyzer/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    DM
        .get<IOpenWeatherMapDatasource>()
        .getCurrentWeatherByLocation()
        .then((final value) {
      if (kDebugMode) {
        print(value);
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: const Center(
        child: Text('This is initial page'),
      ),
    );
  }
}

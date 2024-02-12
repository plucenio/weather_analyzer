import 'package:flutter/material.dart';
import 'package:weather_analyzer/lib.dart';

class CityPage extends StatefulWidget {
  final City city;
  const CityPage({super.key, required this.city});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends ViewState<CityPage, CityPageViewmodel> {
  @override
  Widget build(final BuildContext context) {
    return ViewModelBuilder(
      viewModel: viewModel,
      builder: (final context, final state) => Scaffold(
        appBar: AppBar(title: Text(widget.city.name ?? '')),
        body: Text(widget.city.name ?? ''),
      ),
    );
  }
}

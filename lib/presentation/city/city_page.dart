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
  void initState() {
    super.initState();
    viewModel.fetchData(city: widget.city);
  }

  @override
  Widget build(final BuildContext context) {
    return ViewModelBuilder(
      viewModel: viewModel,
      builder: (final context, final state) => switch (state) {
        CityPageErrorState(errorMessage: final errorMessage) => Scaffold(
              body: Center(
            child: Text(errorMessage),
          )),
        CityPageDataState(temperature: final temperature) => Scaffold(
            appBar: AppBar(
              title: Text(widget.city.name ?? ''),
            ),
            body: Column(children: <Widget>[
              Text(temperature),
            ]),
          ),
        (_) => const Scaffold()
      },
    );
  }
}

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: ViewModelBuilder(
          viewModel: viewModel,
          builder: (final context, final state) => switch (state) {
            CityPageErrorState(errorMessage: final errorMessage) => Center(
                child: Text(errorMessage),
              ),
            CityPageDataState(
              currentWeather: final currentWeather,
              icon: final icon,
            ) =>
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue,
                    ),
                    child: Column(children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                            height: 80.0,
                            width: 80.0,
                            child: Image.network(
                              icon,
                              loadingBuilder: (
                                final context,
                                final child,
                                final loadingProgress,
                              ) {
                                if (loadingProgress == null) return child;
                                return const CircularProgressIndicator();
                              },
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentWeather.main ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                currentWeather.description ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
                  ),
                  const Spacer(),
                ],
              ),
            (_) => const Center(
                child: CircularProgressIndicator(),
              ),
          },
        ),
      ),
    );
  }
}
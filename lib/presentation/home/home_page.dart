import 'package:flutter/material.dart';
import 'package:weather_analyzer/lib.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomePageViewmodel> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cities')),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40.0.toResponsiveWidth,
          ),
          child: ViewModelBuilder(
            viewModel: viewModel,
            builder: (final context, final state) => switch (state) {
              HomePageErrorState(errorMessage: final errorMessage) => Center(
                  child: Text(errorMessage),
                ),
              HomePageDataState(filteredCities: final cities) => Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (final text) {
                        viewModel.filter(text);
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cities.length,
                        itemBuilder: (final context, final index) {
                          return ListTile(
                            title: Text(cities[index].name ?? ''),
                            onTap: () {
                              Nav.pushNamed(
                                BaseModule.homeModule + HomeModule.city,
                                arguments: cities[index],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              (_) => const Center(
                  child: StretchedDots(),
                ),
            },
          ),
        ));
  }
}

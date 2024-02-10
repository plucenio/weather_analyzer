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
    return ViewModelBuilder(
      viewModel: viewModel,
      builder: (final context, final state) {
        switch (state) {
          case HomePageErrorState(errorMessage: final errorMessage):
            {
              return Center(
                child: Text(errorMessage),
              );
            }
          case HomePageLoadingState():
            {
              return const CircularProgressIndicator();
            }
          case HomePageDataState():
            {
              return Scaffold(
                appBar: AppBar(title: const Text('Home Page')),
                body: const Center(
                  child: Text('This is initial page'),
                ),
              );
            }
          default:
            {
              return const CircularProgressIndicator();
            }
        }
      },
    );
  }
}

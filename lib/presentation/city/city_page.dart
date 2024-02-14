import 'package:flutter/material.dart';
import 'package:weather_analyzer/lib.dart';

class CityPage extends StatefulWidget {
  final City city;
  const CityPage({super.key, required this.city});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends ViewState<CityPage, CityPageViewmodel> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    viewModel.fetchData(city: widget.city);
  }

  @override
  Widget build(final BuildContext context) {
    return ViewModelConsumer(
      viewModel: viewModel,
      listenWhen: (final previous, final current) =>
          previous.runtimeType != current.runtimeType,
      listener: (final context, final state) {
        if (state is CityPageDataState) {
          Future.delayed(const Duration(milliseconds: 100), () {
            setState(() {
              _opacity = 1.0;
            });
          });
        }
      },
      builder: (final context, final state) => switch (state) {
        CityPageErrorState(errorMessage: final errorMessage) =>
          ErrorPage(errorMessage: errorMessage),
        CityPageDataState(
          currentWeather: final currentWeather,
          forecastWeather: final forecastWeather,
        ) =>
          Scaffold(
            appBar: AppBar(
              title: Text(widget.city.name ?? ''),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                left: 40.toResponsiveWidth,
                right: 40.toResponsiveWidth,
                bottom: 40.toResponsiveHeight,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedOpacity(
                      opacity: _opacity,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.blue,
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                SizedBox(
                                  height: 80.0.toResponsiveHeight,
                                  width: 80.0.toResponsiveWidth,
                                  child: (currentWeather.icon ?? '').isNotEmpty
                                      ? Image.network(
                                          currentWeather.icon ?? '',
                                          loadingBuilder: (
                                            final context,
                                            final child,
                                            final loadingProgress,
                                          ) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return const StretchedDots();
                                          },
                                        )
                                      : Image.asset('assets/no_connection.png'),
                                ),
                                SizedBox(width: 20.0.toResponsiveWidth),
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
                                ),
                                const Spacer(),
                                Text(
                                  '${currentWeather.temperature ?? ' '}ºC',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.toResponsiveWidth,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0.toResponsiveHeight),
                    const Text(
                      'Next 5 days',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0.toResponsiveHeight),
                    AnimatedOpacity(
                      opacity: _opacity,
                      duration: const Duration(milliseconds: 100),
                      child: Column(
                        children: forecastWeather.map((final item) {
                          return Column(
                            children: [
                              AnimatedOpacity(
                                opacity: _opacity,
                                duration: Duration(
                                    milliseconds:
                                        (forecastWeather.indexOf(item) * 300)
                                            .toInt()),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.blue.shade100,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 70.0.toResponsiveHeight,
                                        width: 70.0.toResponsiveWidth,
                                        child: Image.network(
                                          item.icon ?? '',
                                          loadingBuilder: (
                                            final context,
                                            final child,
                                            final loadingProgress,
                                          ) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return const StretchedDots();
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 20.0.toResponsiveWidth),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(item.main ?? ''),
                                          Text(item.description ?? ''),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(item.dateTime ?? '',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(width: 10.0.toResponsiveWidth),
                                    ],
                                  ),
                                ),
                              ),
                              (item != forecastWeather.last)
                                  ? SizedBox(height: 20.0.toResponsiveHeight)
                                  : Container(),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 10.0.toResponsiveHeight),
                  ],
                ),
              ),
            ),
          ),
        (_) => Scaffold(
            appBar: AppBar(
              title: Text(widget.city.name ?? ''),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                left: 40.toResponsiveWidth,
                right: 40.toResponsiveWidth,
                bottom: 40.toResponsiveHeight,
              ),
              child: const Center(
                child: StretchedDots(),
              ),
            )),
      },
    );
  }
}

import 'package:flutter/material.dart';

const double _defaultHeight = 844.0;
const double _defaultWidth = 390.0;

abstract class IAdaptativeSizer {
  double get screenWidth;
  double get screenHeight;
  bool get isInitialized;
  void initialize(final Size size);
  double toResponsiveHeight(final num height);
  double toResponsiveWidth(final num width);
}

class AdaptativeSizer implements IAdaptativeSizer {
  double _screenHeight = 0;
  double _screenWidth = 0;
  double _screenPercentualHeight = 0;
  double _screenPercentualWidth = 0;
  bool _initialized = false;

  AdaptativeSizer._();

  factory AdaptativeSizer.instance() => AdaptativeSizer._();

  @override
  void initialize(final Size size) {
    _screenHeight = size.height;
    _screenWidth = size.width;
    _screenPercentualHeight = ((100 / _defaultHeight) * screenHeight);
    _screenPercentualWidth = ((100 / _defaultWidth) * screenWidth);
    _initialized = true;
  }

  @override
  double get screenWidth => _screenWidth;

  @override
  double get screenHeight => _screenHeight;

  @override
  bool get isInitialized => _initialized;

  @override
  double toResponsiveHeight(final num height) {
    assert(isInitialized,
        'You have to call AdaptativeSizer().initialize() once a time first');
    return (height / 100) * _screenPercentualHeight;
  }

  @override
  double toResponsiveWidth(final num width) {
    assert(isInitialized,
        'You have to call AdaptativeSizer().initialize() once a time first');
    return (width / 100) * _screenPercentualWidth;
  }
}

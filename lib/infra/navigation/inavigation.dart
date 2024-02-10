import 'package:flutter/widgets.dart';

import 'navigation_arguments.dart';

///
/// Interface for navigation
///
abstract class INavigation {
  /// Returns the [NavigationArguments] instance
  NavigationArguments get args;

  /// Returns the current route path
  String get currentPath;

  ///
  /// Push a named route to the stack
  ///
  Future<T?> pushNamed<T extends Object?>(
    final Object path, {
    final Object? arguments,
    final bool? forRoot,
  });

  ///
  /// Push a route to the stack
  ///
  Future<T?> push<T extends Object?>({required final Route<T> route});

  ///
  /// Push and replace a named route
  ///
  Future<Object?> pushReplacementNamed(
    final Object path, {
    final Object? arguments,
    final bool? forRoot,
  });

  ///
  /// Push a named route and remove routes according to [predicate]
  ///
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    final Object path,
    final bool Function(Route) predicate, {
    final Object? arguments,
    final bool? forRoot,
  });

  ///
  /// Removes all previous routes and navigate to a route.
  ///
  void navigate(final Object path, {final dynamic arguments});

  ///
  /// Pop the current route out of the stack
  ///
  void pop<T extends Object>({final T? response});

  ///
  /// Calls pop repeatedly on the navigator until the predicate returns true.
  ///
  void popUntil(final bool Function(Route<dynamic>) predicate);

  ///
  /// Return true if route can pop
  ///
  bool canPop();

  /// Pop the current route off the navigator and navigate to a route
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    final Object path, {
    final TO? result,
    final Object? arguments,
    final bool forRoot = false,
  });

  /// Register a closure to be called when the object notifies its listeners.
  void addListener(final VoidCallback listener);

  /// Remove a previously registered closure from the list of closures that the
  /// object notifies.
  void removeListener(final VoidCallback listener);

  ///
  /// Current navigation history
  ///
  List<String> get history;
}

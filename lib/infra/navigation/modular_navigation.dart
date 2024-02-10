import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'navigation.dart';

///
/// Navigation implementation using Modular package
///
class ModularNavigation implements INavigation {
  final ModularNavigationArguments _args = ModularNavigationArguments();

  ModularNavigation._();

  static ModularNavigation? _instance;

  ///
  /// Static instance for DM
  ///
  static ModularNavigation i() {
    _instance ??= ModularNavigation._();
    return _instance!;
  }

  @override
  NavigationArguments get args => _args;

  @override
  bool canPop() {
    return Modular.to.canPop();
  }

  @override
  void pop<T extends Object>({final T? response}) {
    if (response != null) {
      Modular.to.pop(response);
    } else {
      Modular.to.pop();
    }
  }

  @override
  Future<T?> pushNamed<T extends Object?>(
    final Object path, {
    final Object? arguments,
    final bool? forRoot,
  }) async {
    return Modular.to.pushNamed<T?>(
      path.toString(),
      arguments: arguments,
      forRoot: forRoot ?? false,
    );
  }

  @override
  Future<T?> push<T extends Object?>({required final Route<T> route}) async {
    return Modular.to.push<T>(route);
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    final Object path,
    final bool Function(Route) predicate, {
    final Object? arguments,
    final bool? forRoot,
  }) async {
    return Modular.to.pushNamedAndRemoveUntil<T>(
      path.toString(),
      predicate,
      arguments: arguments,
      forRoot: forRoot ?? false,
    );
  }

  @override
  Future<Object?> pushReplacementNamed(
    final Object path, {
    final Object? arguments,
    final bool? forRoot,
  }) {
    return Modular.to.pushReplacementNamed<dynamic, dynamic>(
      path.toString(),
      arguments: arguments,
      forRoot: forRoot ?? false,
    );
  }

  @override
  Future<void> navigate(final Object path, {final dynamic arguments}) async {
    return Modular.to.navigate(path.toString(), arguments: arguments);
  }

  @override
  void popUntil(final bool Function(Route) predicate) {
    Modular.to.popUntil(predicate);
  }

  @override
  List<String> get history =>
      Modular.to.navigateHistory.map((final e) => e.name).toList();

  @override
  void addListener(final VoidCallback listener) {
    Modular.to.addListener(listener);
  }

  @override
  void removeListener(final VoidCallback listener) {
    Modular.to.removeListener(listener);
  }

  @override
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    final Object path, {
    final TO? result,
    final Object? arguments,
    final bool forRoot = false,
  }) {
    return Modular.to.popAndPushNamed(
      path.toString(),
      result: result,
      arguments: arguments,
      forRoot: forRoot,
    );
  }

  @override
  String get currentPath => Modular.to.path;
}

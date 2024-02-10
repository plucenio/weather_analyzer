// ignore_for_file: non_constant_identifier_names
import '../lib.dart';

///
/// Provides a static access to a singleton that implements [Navigation]
///
final INavigation Nav = ModularNavigation.i();

///
/// Provides a static access to a singleton that implements [DependencyManager]
///
final IDependencyManager DM = ModularDependencyManager.i();

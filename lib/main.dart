import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'lib.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return runApp(
      ModularApp(
        module: BaseModule(),
        child: const AppWidget(),
      ),
    );
  }, (final error, final stackTrace) {
    if (kDebugMode) {
      print('Caught error: $error');
    }
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'lib.dart';

void main() {
  return runApp(
    ModularApp(
      module: BaseModule(),
      child: const AppWidget(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'lib.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    DM.get<IAdaptativeSizer>().initialize(MediaQuery.of(context).size);
    return MaterialApp.router(
      title: 'Weather Analyzer',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}

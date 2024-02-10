import 'package:flutter/material.dart';
import 'package:weather_analyzer/base_module.dart';
import 'package:weather_analyzer/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((final _) {
      Nav.pushNamed(BaseModule.homeModule);
    });
  }

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

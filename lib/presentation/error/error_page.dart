import 'package:flutter/material.dart';
import 'package:weather_analyzer/utils/extensions/num_extension.dart';

import '../../lib.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;

  const ErrorPage({final Key? key, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/error_image.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 200.toResponsiveHeight,
            left: 30.toResponsiveWidth,
            child: Text(
              errorMessage,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 150.toResponsiveHeight,
            left: 30.toResponsiveWidth,
            child: const Text(
              'Please check your internet connection\nand try again.',
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 40,
            right: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (final Set<MaterialState> states) {
                    return Colors.blue;
                  },
                ),
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (final Set<MaterialState> states) {
                    return Colors.black54;
                  },
                ),
              ),
              child: const Text(
                'go back',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Nav.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

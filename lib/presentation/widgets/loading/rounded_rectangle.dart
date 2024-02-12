import 'package:flutter/material.dart';

class RoundedRectangle extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final bool vertical;
  const RoundedRectangle.vertical({
    final Key? key,
    required this.width,
    required this.height,
    required this.color,
  })  : vertical = true,
        super(key: key);

  const RoundedRectangle.horizontal({
    final Key? key,
    required this.width,
    required this.height,
    required this.color,
  })  : vertical = false,
        super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          vertical ? width : height,
        ),
      ),
    );
  }
}

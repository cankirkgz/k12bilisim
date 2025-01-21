import 'package:flutter/material.dart';

class ColoredImageCard extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;
  final double width;
  final double height;

  const ColoredImageCard({
    super.key,
    required this.imagePath,
    required this.backgroundColor,
    this.width = double.infinity,
    this.height = 150.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Center(
        child: Image.network(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

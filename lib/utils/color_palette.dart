import 'package:flutter/material.dart';
import 'dart:math';

class ColorPalette {
  static final List<Color> pastelColors = [
    Color(0xFFFFC1CC),
    Color(0xFFFFE0B5),
    Color(0xFFFFF1B8),
    Color(0xFFC1E1C1),
    Color(0xFFB5E2FA),
    Color(0xFFD4C1EC),
    Color(0xFFF5D1E6),
    Color(0xFFB4D3B2),
    Color(0xFFFCF6BD),
    Color(0xFFFFD6E0),
  ];

  static Color getRandomPastelColor() {
    final Random random = Random();
    return pastelColors[random.nextInt(pastelColors.length)];
  }
}

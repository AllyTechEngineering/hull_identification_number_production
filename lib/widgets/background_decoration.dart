import 'package:flutter/material.dart';

class BackgroundDecoration {
  static BoxDecoration get backgroundImageDecoration {
    return const BoxDecoration(
      image: DecorationImage(
        opacity: 1.0,
        image: AssetImage('assets/images/ocean_background.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}

import 'package:flutter/material.dart';

const MaterialColor brandingColor = MaterialColor(
  _brandingPrimaryColorValue,
  <int, Color>{
    50: Color.fromRGBO(11, 57, 84, 0.1),
    100: Color.fromRGBO(11, 57, 84, 0.2),
    200: Color.fromRGBO(11, 57, 84, 0.3),
    300: Color.fromRGBO(11, 57, 84, 0.4),
    400: Color.fromRGBO(11, 57, 84, 0.5),
    500: Color(_brandingPrimaryColorValue),
    600: Color.fromRGBO(11, 57, 84, 0.7),
    700: Color.fromRGBO(11, 57, 84, 0.8),
    800: Color.fromRGBO(11, 57, 84, 0.9),
    900: Color.fromRGBO(11, 57, 84, 1),
  },
);
const int _brandingPrimaryColorValue = 0xFF0B3954;

/*
 * Color Pallete
 * */

// Beau Blue
const MaterialColor secondaryColor = MaterialColor(
  _secondaryColorValue,
  <int, Color>{
    50: Color.fromRGBO(191, 215, 234, 0.1),
    100: Color.fromRGBO(191, 215, 234, 0.2),
    200: Color.fromRGBO(191, 215, 234, 0.3),
    300: Color.fromRGBO(191, 215, 234, 0.4),
    400: Color.fromRGBO(191, 215, 234, 0.5),
    500: Color(_secondaryColorValue),
    600: Color.fromRGBO(191, 215, 234, 0.7),
    700: Color.fromRGBO(191, 215, 234, 0.8),
    800: Color.fromRGBO(191, 215, 234, 0.9),
    900: Color.fromRGBO(191, 215, 234, 1),
  },
);
const int _secondaryColorValue = 0xFFBFD7EA;

// BitterSweet
const MaterialColor sweetColor = MaterialColor(
  _sweetColorValue,
  <int, Color>{
    50: Color.fromRGBO(255, 102, 99, 0.1),
    100: Color.fromRGBO(255, 102, 99, 0.2),
    200: Color.fromRGBO(255, 102, 99, 0.3),
    300: Color.fromRGBO(255, 102, 99, 0.4),
    400: Color.fromRGBO(255, 102, 99, 0.5),
    500: Color(_sweetColorValue),
    600: Color.fromRGBO(255, 102, 99, 0.7),
    700: Color.fromRGBO(255, 102, 99, 0.8),
    800: Color.fromRGBO(255, 102, 99, 0.9),
    900: Color.fromRGBO(255, 102, 99, 1),
  },
);
const int _sweetColorValue = 0xFFFF6663;

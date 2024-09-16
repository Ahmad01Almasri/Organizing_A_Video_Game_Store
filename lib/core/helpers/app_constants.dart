import 'package:flutter/material.dart';

abstract class AppConstants {
  static List<String> deviceName(BuildContext context) {
    return [
      "laptop",
      "playstation",
      "computer",
    ];
  }
}

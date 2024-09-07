import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

abstract class AppConstants {
  static List<String> deviceName(BuildContext context) {
    return [
      S.of(context).laptop,
      S.of(context).playstation,
      S.of(context).computer,
    ];
  }

  static String? validationNotEmpty(BuildContext context, String? value) {
    if ((value ?? '').isEmpty) return S.of(context).field_required;
    return null;
  }
}

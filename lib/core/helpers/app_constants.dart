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


}

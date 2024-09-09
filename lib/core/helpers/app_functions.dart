import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';

abstract class AppFunctions {
  static bool isLanguageArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  static String? validationNotEmpty(BuildContext context, String? value) {
    if ((value ?? '').isEmpty) return S.of(context).field_required;
    return null;
  }
}

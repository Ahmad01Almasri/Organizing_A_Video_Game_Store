import 'package:intl/intl.dart';

bool IsArabic() {
  return Intl.getCurrentLocale() == 'ar';
}

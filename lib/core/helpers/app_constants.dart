abstract class AppConstants {
  static List<String> deviceName = [
    'لابتوب',
    'بلايستيشن',
    'حاسب',
  ];
  static String? validationNotEmpty(String? value) {
    if ((value ?? '').isEmpty) return "لا يمكن ترك الحقل فارغ";
    return null;
  }
}

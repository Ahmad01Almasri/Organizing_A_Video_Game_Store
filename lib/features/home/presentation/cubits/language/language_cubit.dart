import 'dart:ui'; // لاستيراد window.locale
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(Locale('ar')); // استخدام لغة النظام كلغة افتراضية

  void toggleLanguage() {
    final newLocale =
        state.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    emit(newLocale);
  }
}

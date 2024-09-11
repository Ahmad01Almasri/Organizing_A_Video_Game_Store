import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en'));

  void toggleLanguage() {
    final newLocale =
        state.languageCode == 'en' ? const Locale('ar') : const Locale('en');
    emit(newLocale);
  }
}

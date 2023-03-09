import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit_localization/language_cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  Future<void> getSavedLanguageCode() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(LocaleChangedState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguageCode(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(LocaleChangedState(locale: Locale(languageCode)));
  }
}
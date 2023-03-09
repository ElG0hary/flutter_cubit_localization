part of 'locale_cubit.dart';

@immutable
abstract class LocaleState {}

class LocaleInitial extends LocaleState {}

class LocaleChangedState extends LocaleState {
  final Locale locale;

  LocaleChangedState({required this.locale});
}

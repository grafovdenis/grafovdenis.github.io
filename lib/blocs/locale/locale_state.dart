part of 'locale_cubit.dart';

enum AppLocale { en, ru }

extension ToString on AppLocale {
  String toShortString() => this.toString().split(".").last;
}

@immutable
abstract class LocaleState {
  final AppLocale locale;
  const LocaleState({this.locale});
}

class LocaleInitial extends LocaleState {
  const LocaleInitial() : super(locale: AppLocale.ru);
}

class ChangedLocale extends LocaleState {
  const ChangedLocale({AppLocale locale}) : super(locale: locale);
}

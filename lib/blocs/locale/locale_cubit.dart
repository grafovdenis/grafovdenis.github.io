import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  void switchLocale() {
    if (state.locale == AppLocale.en) {
      emit(ChangedLocale(locale: AppLocale.ru));
    } else {
      emit(ChangedLocale(locale: AppLocale.en));
    }
  }
}

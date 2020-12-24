import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void switchTheme() {
    if (state.theme == AppTheme.dark) {
      emit(ChangedTheme(theme: AppTheme.light));
    } else {
      emit(ChangedTheme(theme: AppTheme.dark));
    }
  }
}

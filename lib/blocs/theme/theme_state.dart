part of 'theme_cubit.dart';

enum AppTheme { light, dark }

@immutable
abstract class ThemeState {
  final AppTheme theme;
  const ThemeState({this.theme});
}

class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(theme: AppTheme.light);
}

class ChangedTheme extends ThemeState {
  const ChangedTheme({AppTheme theme}) : super(theme: theme);
}

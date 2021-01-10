part of 'theme_cubit.dart';

enum AppTheme { light, dark }

@immutable
abstract class ThemeState {
  final AppTheme theme;
  const ThemeState({this.theme});
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({AppTheme theme}) : super(theme: theme);
}

class ChangedTheme extends ThemeState {
  const ChangedTheme({AppTheme theme}) : super(theme: theme);
}

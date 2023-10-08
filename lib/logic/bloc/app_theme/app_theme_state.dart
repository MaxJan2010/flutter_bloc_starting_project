part of 'app_theme_bloc.dart';

sealed class AppThemeState extends Equatable {
  const AppThemeState();

  @override
  List<Object> get props => [];
}

class AppThemeInitialState extends AppThemeState {
  final String? appThemeType;

  const AppThemeInitialState({this.appThemeType});
}

class AppThemeLightState extends AppThemeState {
  final String? appThemeType;

  const AppThemeLightState({this.appThemeType});
}

class AppThemeDarkState extends AppThemeState {
  final String? appThemeType;

  const AppThemeDarkState({this.appThemeType});
}

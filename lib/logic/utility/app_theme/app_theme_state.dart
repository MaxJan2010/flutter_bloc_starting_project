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

class AppThemeChangeState extends AppThemeState {
  final String? appThemeType;

  const AppThemeChangeState({this.appThemeType});
}

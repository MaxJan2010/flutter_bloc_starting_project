part of 'app_theme_bloc.dart';

sealed class AppThemeEvent extends Equatable {
  const AppThemeEvent();

  @override
  List<Object> get props => [];
}

class AppThemeInitialEvent extends AppThemeEvent {}

class AppThemeLightEvent extends AppThemeEvent {}

class AppThemeDarkEvent extends AppThemeEvent {}


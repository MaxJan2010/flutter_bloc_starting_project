import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_hossam_hamed/data/config/local_storage.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(const AppThemeInitialState()) {
    on<AppThemeEvent>((event, emit) {
      if (event is AppThemeInitialEvent) {
        if (sharedPrefer!.getString('theme') != null) {
          if (sharedPrefer!.getString('theme') == 'light') {
            emit(const AppThemeChangeState(appThemeType: 'light'));
          } else if (sharedPrefer!.getString('theme') == 'dark') {
            emit(const AppThemeChangeState(appThemeType: 'dark'));
          }
        }
      } else if (event is AppThemeLightEvent) {
        sharedPrefer!.setString('theme', 'light');
        emit(const AppThemeChangeState(appThemeType: 'light'));
      } else if (event is AppThemeDarkEvent) {
        sharedPrefer!.setString('theme', 'dark');
        emit(const AppThemeChangeState(appThemeType: 'dark'));
      }
    });
  }
}

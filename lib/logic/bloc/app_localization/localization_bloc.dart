import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/config/local_storage.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class AppLocalizationBloc extends Bloc<AppLocalizationEvent, AppLocalizationState> {
  AppLocalizationBloc() : super(AppLocalizationInitialState()) {
    on<AppLocalizationEvent>((event, emit) {
      if (event is AppLocalizationInitialEvent) {
        if (sharedPrefer!.getString('lang') != null) {
          if (sharedPrefer!.getString('lang') == 'ar') {
            emit(const AppLocalizationChangeState(languageCode: 'ar'));
          } else if (sharedPrefer!.getString('lang') == 'en') {
            emit(const AppLocalizationChangeState(languageCode: 'en'));
          }
        }
      } else if (event is AppLocalizationArabicEvent) {
        sharedPrefer!.setString('lang', 'ar');
        emit(const AppLocalizationChangeState(languageCode: 'ar'));
      } else if (event is AppLocalizationEnglishEvent) {
        sharedPrefer!.setString('lang', 'en');
        emit(const AppLocalizationChangeState(languageCode: 'en'));
      }
    });
  }
}

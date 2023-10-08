import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/config/local_storage.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitialState()) {
    on<LocalizationEvent>((event, emit) {
      if (event is LocalizationInitialEvent) {
        if (sharedPrefer!.getString('lang') != null) {
          if (sharedPrefer!.getString('lang') == 'ar') {
            emit(const LocalizationChangeState(languageCode: 'ar'));
          } else if (sharedPrefer!.getString('lang') == 'en') {
            emit(const LocalizationChangeState(languageCode: 'en'));
          }
        }
      } else if (event is LocalizationArabicEvent) {
        sharedPrefer!.setString('lang', 'ar');
        emit(const LocalizationChangeState(languageCode: 'ar'));
      } else if (event is LocalizationEnglishEvent) {
        sharedPrefer!.setString('lang', 'en');
        emit(const LocalizationChangeState(languageCode: 'en'));
      }
    });
  }
}

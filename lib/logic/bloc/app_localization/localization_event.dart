part of 'localization_bloc.dart';

sealed class AppLocalizationEvent extends Equatable {
  const AppLocalizationEvent();

  @override
  List<Object> get props => [];
}

class AppLocalizationInitialEvent extends AppLocalizationEvent {}

class AppLocalizationArabicEvent extends AppLocalizationEvent {}

class AppLocalizationEnglishEvent extends AppLocalizationEvent {}


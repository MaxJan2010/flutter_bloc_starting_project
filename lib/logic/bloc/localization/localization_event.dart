part of 'localization_bloc.dart';

sealed class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class LocalizationInitialEvent extends LocalizationEvent {}

class LocalizationArabicEvent extends LocalizationEvent {}

class LocalizationEnglishEvent extends LocalizationEvent {}


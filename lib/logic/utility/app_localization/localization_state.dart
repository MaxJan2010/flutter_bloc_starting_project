// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'localization_bloc.dart';

sealed class AppLocalizationState extends Equatable {
  const AppLocalizationState();

  @override
  List<Object> get props => [];
}

class AppLocalizationInitialState extends AppLocalizationState {
/*   final String? language;
  const LocalizationInitialState({
    this.language,
  }); */
}

class AppLocalizationChangeState extends AppLocalizationState {
  final String? languageCode;
  const AppLocalizationChangeState({
    this.languageCode,
  });
}

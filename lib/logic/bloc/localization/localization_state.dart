// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'localization_bloc.dart';

sealed class LocalizationState extends Equatable {
  const LocalizationState();

  @override
  List<Object> get props => [];
}

class LocalizationInitialState extends LocalizationState {
/*   final String? language;
  const LocalizationInitialState({
    this.language,
  }); */
}

class LocalizationChangeState extends LocalizationState {
  final String? languageCode;
  const LocalizationChangeState({
    this.languageCode,
  });
}

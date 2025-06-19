import '../../model/language_response.dart';

abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageValueDownloaded extends LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final List<Language> languages;
  final Language? selected;

  LanguageLoaded(this.languages, {this.selected});
}

class LanguageError extends LanguageState {
  final String message;
  LanguageError(this.message);
}
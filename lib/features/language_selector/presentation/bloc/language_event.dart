import '../../model/language_response.dart';

abstract class LanguageEvent {}

class FetchLanguages extends LanguageEvent {}

class SelectLanguage extends LanguageEvent {
  final Language? selectedLanguage;

  SelectLanguage({this.selectedLanguage});
}

class LoadLanguageToPreferences extends LanguageEvent {}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_event.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_state.dart';
import 'package:myco_flutter/features/language_selector/repositories/language_repository.dart';


class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageRepository repository;
  final PreferenceManager preference = GetIt.I<PreferenceManager>();

  LanguageBloc(this.repository) : super(LanguageInitial()) {
    on<FetchLanguages>(_onFetch);
    on<SelectLanguage>(_onSelect);
  }

  void _onFetch(FetchLanguages event, Emitter<LanguageState> emit) async {
    emit(LanguageLoading());
    try {
      final languages = await repository.getAppLanguage();
      // if (languages.language != null &&
      //     languages.language!.isNotEmpty) {
      //   emit(LanguageLoaded(languages.language!));
      // } else {
      //   emit(LanguageError("Failed to load languages"));
      // }
    } catch (e) {
      emit(LanguageError("Failed to load languages"));
    }
  }

  void _onSelect(SelectLanguage event, Emitter<LanguageState> emit) async {
    if (state is LanguageLoaded) {
      final current = (state as LanguageLoaded).languages;
      emit(LanguageLoaded(current, selected: event.selectedLanguage));
      // fetch and store language JSON from languageFile
      final success = await repository.getAppLanguageValues(
        event.selectedLanguage.languageId ?? "1",
        preference.getCompanyId().toString(),
      );
      // if (success) {
      //   emit(LanguageValueDownloaded());
      // } else {
      //   emit(LanguageError("Failed to load language values"));
      // }
    }
  }
}

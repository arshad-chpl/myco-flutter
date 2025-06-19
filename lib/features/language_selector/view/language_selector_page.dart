import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../widgets/custom_text.dart';
import '../presentation/bloc/language_bloc.dart';
import '../presentation/bloc/language_event.dart';
import '../presentation/bloc/language_state.dart';
import '../model/language_response.dart';
import '../repositories/language_repository.dart';

class LanguageSelectorPage extends StatelessWidget {
  const LanguageSelectorPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) =>
      LanguageBloc(GetIt.I<LanguageRepository>())..add(FetchLanguages()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Select Language")),
        body: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LanguageLoaded) {
              return ListView.separated(
                itemCount: state.languages.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final lang = state.languages[index];
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Image(
                        width: 100,
                        image:  NetworkImage(lang.languageIcon ?? ''),
                      ),
                      title: CustomText(lang.languageName ?? '',fontSize: 20,fontWeight: FontWeight.bold,),
                      trailing: Radio<Language>(
                        value: lang,
                        groupValue: state.selected,
                        onChanged: (Language? value) {
                          if (value != null) {
                            context.read<LanguageBloc>().add(SelectLanguage(value));
                          }
                        },
                      ),
                      onTap: () => context.read<LanguageBloc>().add(SelectLanguage(lang)),
                    ),
                  );
                },
              );
            } else if (state is LanguageError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
}
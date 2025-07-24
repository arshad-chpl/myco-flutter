// form_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_form_event.dart';
import 'my_form_state.dart';
// import 'your_api_repository.dart'; // Assume you have a repository for API calls

class MyFormBloc extends Bloc<MyFormEvent, MyFormState> {
  // final YourApiRepository _apiRepository;

  MyFormBloc(/*this._apiRepository*/) : super(const MyFormState()) {
    on<FieldValueChanged>(_onFieldValueChanged);
  }

  Future<void> _onFieldValueChanged(
      FieldValueChanged event,
      Emitter<MyFormState> emit,
      ) async {
    // 1. Emit loading state
    emit(state.copyWith(status: FormStatus.loading));

    try {
      // 2. Call your API
      // await _apiRepository.updateField(field: event.field, value: event.value);

      // 3. On success, update the state with the new value
      emit(state.copyWith(
        status: FormStatus.success,
        fieldOneValue: event.field == FormField.fieldOne ? event.value : state.fieldOneValue,
        fieldTwoValue: event.field == FormField.fieldTwo ? event.value : state.fieldTwoValue,
      ));
    } catch (e) {
      // 4. On failure, emit an error state
      emit(state.copyWith(status: FormStatus.failure, errorMessage: e.toString()));
    }
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_form_event.dart';
import 'my_form_state.dart';

// In my_form_bloc.dart

class MyFormBloc extends Bloc<MyFormEvent, MyFormState> {
  MyFormBloc() : super(const MyFormState()) {
    on<UpdateSelectedData>(_onUpdateSelectedData);
  }

  void _onUpdateSelectedData(UpdateSelectedData event, Emitter<MyFormState> emit,) {
    print('BLOC: Event received with key: "${event.fieldKey}"');
    print('BLOC: Current state before emit is: ${state.props}');

    final newState = state.copyWith(
      selectedId: event.id,
      selectedName: event.name,
      fieldKey: event.fieldKey,
      status: FormStatus.success,
    );

    print('BLOC: New state to be emitted is: ${newState.props}');
    emit(newState);
  }
}
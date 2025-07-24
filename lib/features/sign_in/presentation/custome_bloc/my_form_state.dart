// my_form_state.dart
import 'package:equatable/equatable.dart';

enum FormStatus { initial, loading, success, failure }

class MyFormState extends Equatable {
  const MyFormState({
    this.status = FormStatus.initial,
    this.fieldOneValue = '',
    this.fieldTwoValue = '',
    this.errorMessage,
  });

  final FormStatus status;
  final String fieldOneValue;
  final String fieldTwoValue;
  final String? errorMessage;

  MyFormState copyWith({
    FormStatus? status,
    String? fieldOneValue,
    String? fieldTwoValue,
    String? errorMessage,
  }) => MyFormState(
      status: status ?? this.status,
      fieldOneValue: fieldOneValue ?? this.fieldOneValue,
      fieldTwoValue: fieldTwoValue ?? this.fieldTwoValue,
      errorMessage: errorMessage ?? this.errorMessage,
    );

  @override
  List<Object?> get props => [status, fieldOneValue, fieldTwoValue, errorMessage];
}
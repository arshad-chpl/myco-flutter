import 'package:equatable/equatable.dart';

// An enum to identify which field is being updated
enum FormField { fieldOne, fieldTwo }

abstract class MyFormEvent extends Equatable {
  const MyFormEvent();
  @override
  List<Object> get props => [];
}

class FieldValueChanged extends MyFormEvent {
  const FieldValueChanged({required this.field, required this.value});

  final FormField field;
  final String value;

  @override
  List<Object> get props => [field, value];
}
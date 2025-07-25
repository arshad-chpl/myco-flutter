import 'package:equatable/equatable.dart';

enum FormStatus { initial, success, failure }

class MyFormState extends Equatable {
  const MyFormState({
    this.status = FormStatus.initial,
    this.selectedId,
    this.selectedName,
    this.fieldKey,
  });

  final FormStatus status;
  final String? selectedId;
  final String? selectedName;
  final String? fieldKey; // Key to identify the updated field

  MyFormState copyWith({
    FormStatus? status,
    String? selectedId,
    String? selectedName,
    String? fieldKey,
  }) => MyFormState(
    status: status ?? this.status,
    selectedId: selectedId ?? this.selectedId,
    selectedName: selectedName ?? this.selectedName,
    fieldKey: fieldKey ?? this.fieldKey,
  );

  @override
  List<Object?> get props => [status, selectedId, selectedName, fieldKey];
}
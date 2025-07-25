import 'package:equatable/equatable.dart';

/// EVENT: Generic — only ID & Name
abstract class MyFormEvent extends Equatable {
  const MyFormEvent();
  @override
  List<Object> get props => [];
}

/// This is all you need: ID, Name, and a key to identify the field.
class UpdateSelectedData extends MyFormEvent {
  final String id;
  final String name;
  final String fieldKey;

  const UpdateSelectedData({required this.id, required this.name, required this.fieldKey});

  @override
  List<Object> get props => [id, name, fieldKey];
}
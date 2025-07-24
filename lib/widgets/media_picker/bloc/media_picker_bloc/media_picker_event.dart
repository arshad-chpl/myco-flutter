import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class CustomMediaPickerEvent extends Equatable {
  const CustomMediaPickerEvent();

  @override
  List<Object?> get props => [];
}

class AddMediaFiles extends CustomMediaPickerEvent {
  final List<File> files;

  const AddMediaFiles(this.files);

  @override
  List<Object?> get props => [files];
}

class RemoveMediaFile extends CustomMediaPickerEvent {
  final int index;

  const RemoveMediaFile(this.index);

  @override
  List<Object?> get props => [index];
}

class RemoveDocument extends CustomMediaPickerEvent {}

class ResetMedia extends CustomMediaPickerEvent {}

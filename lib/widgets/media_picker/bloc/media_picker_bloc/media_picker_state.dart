import 'dart:io';
import 'package:equatable/equatable.dart';

class CustomMediaPickerState extends Equatable {
  final List<File> images;
  final File? document;

  const CustomMediaPickerState({this.images = const [], this.document});

  CustomMediaPickerState copyWith({List<File>? images, File? document}) =>
      CustomMediaPickerState(images: images ?? this.images, document: document);

  @override
  List<Object?> get props => [images, document];
}

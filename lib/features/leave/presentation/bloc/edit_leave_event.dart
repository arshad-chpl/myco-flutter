import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class EditLeaveEvent extends Equatable {
  const EditLeaveEvent();
}

// 🔄 Existing event: selecting an image
class ImageSelectedEvent extends EditLeaveEvent {
  final File file;

  const ImageSelectedEvent(this.file);

  @override
  List<Object?> get props => [file];
}

// ❌ New event: removing selected image
class RemoveSelectedImageEvent extends EditLeaveEvent {
  const RemoveSelectedImageEvent();

  @override
  List<Object?> get props => [];
}

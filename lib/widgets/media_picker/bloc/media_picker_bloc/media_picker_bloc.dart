import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/media_picker_bloc/media_picker_event.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/media_picker_bloc/media_picker_state.dart';

class CustomMediaPickerBloc
    extends Bloc<CustomMediaPickerEvent, CustomMediaPickerState> {
  CustomMediaPickerBloc() : super(const CustomMediaPickerState()) {
    on<AddMediaFiles>(_onAddMediaFiles);
    on<RemoveMediaFile>(_onRemoveMediaFile);
    on<RemoveDocument>(_onRemoveDocument);
    on<ResetMedia>((event, emit) => emit(const CustomMediaPickerState()));
  }

  void _onAddMediaFiles(
    AddMediaFiles event,
    Emitter<CustomMediaPickerState> emit,
  ) {
    final Map<String, List<File>> result = _filterFiles(event.files);

    if (result['document']!.isNotEmpty) {
      emit(state.copyWith(document: result['document']!.first, images: []));
    } else if (result['images']!.isNotEmpty) {
      emit(
        state.copyWith(
          images: [...state.images, ...result['images']!],
          document: null,
        ),
      );
    }
  }

  void _onRemoveMediaFile(
    RemoveMediaFile event,
    Emitter<CustomMediaPickerState> emit,
  ) {
    final newImages = [...state.images]..removeAt(event.index);
    emit(state.copyWith(images: newImages));
  }

  void _onRemoveDocument(
    RemoveDocument event,
    Emitter<CustomMediaPickerState> emit,
  ) {
    emit(state.copyWith(document: null));
  }

  Map<String, List<File>> _filterFiles(List<File> files) {
    final List<File> images = [];
    final List<File> document = [];

    for (final file in files) {
      final ext = file.path.toLowerCase();
      if (ext.endsWith('.png') ||
          ext.endsWith('.jpg') ||
          ext.endsWith('.jpeg') ||
          ext.endsWith('.heic') ||
          ext.endsWith('.heif')) {
        images.add(file);
      } else if (ext.endsWith('.pdf') ||
          ext.endsWith('.doc') ||
          ext.endsWith('.docx')) {
        document.add(file);
      }
    }

    return {'images': images, 'document': document};
  }
}

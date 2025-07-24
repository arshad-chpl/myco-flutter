import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/edit_leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/edit_leave_state.dart';

class EditLeaveBloc extends Bloc<EditLeaveEvent, EditLeaveState> {
  EditLeaveBloc() : super(const EditLeaveState()) {
    on<ImageSelectedEvent>(_onImageSelected);
    on<RemoveSelectedImageEvent>(_onImageRemoved); // 👈 added
  }

  void _onImageSelected(
    ImageSelectedEvent event,
    Emitter<EditLeaveState> emit,
  ) {
    log('Emitting new state with image: ${event.file.path}', name: 'BLoC');
    emit(state.copyWith(selectedImage: event.file));
  }

  void _onImageRemoved(
    RemoveSelectedImageEvent event,
    Emitter<EditLeaveState> emit,
  ) {
    log('Removing selected image', name: 'BLoC');
    emit(state.copyWith(selectedImage: null)); // 👈 clear the image
  }
}

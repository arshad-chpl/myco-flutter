import 'dart:io';

import 'package:equatable/equatable.dart';

class EditLeaveState extends Equatable {
  final File? selectedImage;

  const EditLeaveState({this.selectedImage});

  EditLeaveState copyWith({File? selectedImage}) =>
      EditLeaveState(selectedImage: selectedImage);

  @override
  List<Object?> get props =>
      // ✅ Include something unique (e.g., lastModified or full path string)
      [
        selectedImage?.path,
        selectedImage?.lastModifiedSync().millisecondsSinceEpoch,
      ];
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myco_flutter/widgets/media_picker/widgets/media_picker.dart';

Future<List<File>?> showLeaveEditAttachmentPicker({
  required BuildContext context,
  int maxCount = 1,
  bool isCameraShow = true,
  bool isGalleryShow = true,
  bool isDocumentShow = true,
  bool isCropImage = false,
}) async {
  List<File>? selectedFiles;

  await showMediaFilePicker(
    context: context,
    maxCount: maxCount,
    isCameraShow: isCameraShow,
    isGalleryShow: isGalleryShow,
    isDocumentShow: isDocumentShow,
    isCropImage: isCropImage,
  );

  return selectedFiles;
}

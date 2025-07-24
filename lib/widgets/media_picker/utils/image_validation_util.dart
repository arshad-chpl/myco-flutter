import 'dart:io';
import 'package:path/path.dart' as path;

class ImageValidationUtil {
  static Future<Map<String, dynamic>> validateAndHandleImages({
    required List<File> files,
  }) async {
    final List<File> validFiles = [];
    final List<Map<String, dynamic>> invalidFiles = [];

    for (File file in files) {
      final String fileName = path.basename(file.path).toLowerCase();
      if (fileName.endsWith('.webp')) {
        invalidFiles.add({'file': file, 'reason': 'format'});
      } else {
        try {
          final int size = await file.length();
          if (size > 5 * 1024 * 1024) {
            // 5MB in bytes
            invalidFiles.add({'file': file, 'reason': 'size'});
          } else {
            validFiles.add(file);
          }
        } catch (e) {
          // Handle potential errors like file not found or inaccessible
          invalidFiles.add({'file': file, 'reason': 'error accessing file'});
        }
      }
    }

    return {'validFiles': validFiles, 'invalidFiles': invalidFiles};
  }
}

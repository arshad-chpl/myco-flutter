// file_preview_tile.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:path/path.dart' as p;

class FilePreviewTile extends StatelessWidget {
  final File file;
  final double height;
  final double width;
  final VoidCallback onRemove;

  const FilePreviewTile({
    Key? key,
    required this.file,
    required this.onRemove,
    required this.height,
    required this.width,
  }) : super(key: key);

  bool isImage(String ext) {
    final lower = ext.toLowerCase();
    return ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'].contains(lower);
  }

  String getIconPath(String ext) {
    switch (ext.toLowerCase()) {
      case '.pdf':
        return AppAssets.leavePdf;
      case '.doc':
      case '.docx':
        return AppAssets.leaveCsv;
      case '.xls':
      case '.xlsx':
        return AppAssets.leaveXls;
      case '.ppt':
      case '.pptx':
        return AppAssets.leavePdf;
      case '.txt':
        return AppAssets.leavePdf;
      default:
        return AppAssets.leavePdf;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fileName = p.basename(file.path);
    final ext = p.extension(file.path);

    final previewWidget = isImage(ext)
        ? Image.file(
            file,
            fit: BoxFit.cover,
            width: width,
            height: height * 0.7,
          )
        : Image.asset(
            getIconPath(ext),
            height: height * 0.7,
            width: width,
            fit: BoxFit.contain,
          );

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: previewWidget,
                ),
              ),
              if (!isImage(ext))
                Padding(
                  padding: EdgeInsets.only(top: Responsive.scaleHeight(6)),
                  child: Text(
                    fileName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: Responsive.scaleText(13)),
                  ),
                ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: EdgeInsets.all(Responsive.scaleWidth(4)),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  size: Responsive.scaleText(14),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

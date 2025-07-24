import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/edit_leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/edit_leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/edit_leave_state.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/file_preview_tile.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/media_picker/widgets/design_border_container.dart';
import 'package:myco_flutter/widgets/media_picker/widgets/media_picker.dart';

class EditLeave extends StatelessWidget {
  const EditLeave({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Scaffold(
      appBar: const CustomAppbar(
        isKey: true,
        centerTitle: true,
        title: 'edit_leave_attachment',
        titleSpacing: 0,
        leading: BackButton(),
        // backgroundColor: const Color(0xFFF6F7FB),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.04 * Responsive.getWidth(context),
          vertical: 0.02 * Responsive.getHeight(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<EditLeaveBloc, EditLeaveState>(
              builder: (context, state) {
                if (state.selectedImage != null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LanguageManager().get('attachment')),
                      const SizedBox(height: 10),
                      DesignBorderContainer(
                        onTap: () async {
                          List<File>? selectedFiles = await showMediaFilePicker(
                            context: context,
                            maxCount: 1,
                            isCameraShow: true,
                            isGalleryShow: true,
                            isDocumentShow: true,
                            isCropImage: false,
                          );
                          if (selectedFiles != null &&
                              selectedFiles.isNotEmpty) {
                            context.read<EditLeaveBloc>().add(
                              ImageSelectedEvent(selectedFiles.first),
                            );
                            log('Selected Files: ${selectedFiles.first.path}');
                          }
                        },
                        width: 0.4 * Responsive.getWidth(context),
                        height: 0.2 * Responsive.getHeight(context),
                        padding: const EdgeInsets.all(0),
                        borderRadius: 10,
                        backgroundColor: AppTheme.getColor(context).surface,
                        child: FilePreviewTile(
                          height: 0.2 * Responsive.getHeight(context),
                          width: 0.4 * Responsive.getWidth(context),
                          file: state.selectedImage!,
                          onRemove: () {
                            context.read<EditLeaveBloc>().add(
                              RemoveSelectedImageEvent(),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(LanguageManager().get('attachment')),
                    DesignBorderContainer(
                      onTap: () async {
                        List<File>? selectedFiles = await showMediaFilePicker(
                          context: context,
                          maxCount: 1,
                          isCameraShow: true,
                          isGalleryShow: true,
                          isDocumentShow: true,
                          isCropImage: false,
                        );
                        if (selectedFiles != null && selectedFiles.isNotEmpty) {
                          context.read<EditLeaveBloc>().add(
                            ImageSelectedEvent(selectedFiles.first),
                          );
                          log('Selected Files: ${selectedFiles.first.path}');
                        }
                      },
                      width: 0.4 * Responsive.getWidth(context),
                      height: 0.03 * Responsive.getHeight(context),
                      padding: const EdgeInsets.all(0),
                      borderRadius: 10,
                      backgroundColor: AppTheme.getColor(context).surface,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/visit/document-text.svg',
                            ),
                            Text(LanguageManager().get('select_attachment')),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            MyCoButton(onTap: () {}, title: 'update'),
          ],
        ),
      ),
    );
  }
}

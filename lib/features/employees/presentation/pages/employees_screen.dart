import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      title: 'Junagadh',
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      titileColor: AppTheme.getColor(context).onSurface,
      // fontWeight: AppTextTheme.getTextTheme(context).titleMedium,
    ),
    body: Column(
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomMediaPickerContainer(
            title: 'Assets Image',
            titleFontSize: 14,
            imageTitle: 'Capture Image',
            containerHeight: 100,
            multipleImage: 5,
            imagePath: 'assets/media_picker/gallery-export.png',
            backgroundColor: Colors.blue.shade50,
            isCameraShow: true,
            isGalleryShow: true,
            isDocumentShow: true,
            isCropImage: true,
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';

class ViewDocumentScreen extends StatefulWidget {
  const ViewDocumentScreen({super.key});

  @override
  State<ViewDocumentScreen> createState() => _ViewDocumentScreenState();
}

class _ViewDocumentScreenState extends State<ViewDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.new(
        appBarBackgoundColor: AppTheme.getColor(context).onPrimary,
        appbartxtcolor: AppTheme.getColor(context).onSurface,
        appBarText: 'View Document',
        fontWeight: FontWeight.w600,
        size: 20,
      ),
    );
  }
}

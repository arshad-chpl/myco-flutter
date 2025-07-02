import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/custom_appbar.dart';
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
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(CupertinoIcons.arrow_left, size: 20),
            const SizedBox(width: 16),
            CustomText(
              'Junagadh',
              fontSize: 18 * getResponsiveText(context),
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      appbartxtcolor: AppTheme.getColor(context).onSurface,
      // fontWeight: AppTextTheme.getTextTheme(context).titleMedium,
    ),
  );
}

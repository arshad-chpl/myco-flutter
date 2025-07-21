import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/creat_group_bottomsheet.dart';

import 'package:myco_flutter/features/chat/presentation/widgets/employee_avatar.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/select_employee.dart';
import 'package:myco_flutter/widgets/custom_multiselect_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class SelectGroupEmp extends StatelessWidget {
  SelectGroupEmp({super.key});
  final List<Map<String, String>> departments = [
    {'id': '1', 'department': 'QA Sales', 'name': 'Ajit Maurya'},
    {'id': '2', 'department': 'Product ', 'name': 'Manish'},
    {'id': '3', 'department': 'Technical ', 'name': 'Rohit Maurya'},
    {'id': '4', 'department': 'Marketing', 'name': 'Path jadhav'},
    {'id': '5', 'department': 'HR', 'name': 'Kamal modi'},
  ];
  @override
  Widget build(BuildContext context) => BlocBuilder<ChatBloc, ChatState>(
    builder: (context, state) => Container(
      height: Responsive.getHeight(context) * 0.8,
      padding: EdgeInsets.only(
        top: 8 * Responsive.getResponsive(context),
        left: 30 * Responsive.getResponsive(context),
        right: 30 * Responsive.getResponsive(context),
      ),
      decoration: BoxDecoration(
        color: AppTheme.getColor(context).onPrimary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30 * Responsive.getResponsive(context)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomText(
                'select_group_members',
                fontSize: 16 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.keyboard_double_arrow_down,
                  size: 30 * Responsive.getResponsive(context),
                  color: AppTheme.getColor(context).primary,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          // SizedBox(height: 12 * Responsive.getResponsive(context)),
          MyCoTextfield(
            hintText: LanguageManager().get('search'),
            hintTextStyle: AppTheme.getTextStyle(
              context,
            ).labelLarge!.copyWith(color: AppColors.textSecondary),
            prefix: Image.asset('assets/chat/search-icon.png', scale: 20),
            contentPadding: EdgeInsets.only(
              top: 0.012 * Responsive.getHeight(context),
            ),
            boarderRadius: 12 * Responsive.getResponsive(context),
            onChanged: (value) => {},
          ),
          // SizedBox(height: 0.001 * Responsive.getHeight(context)),
          //  MultiDepartmentSelector(departments: departments),
          CustomMultiSelectChipWidget(
            items: departments,
            labelText: "floors",
            hintText: "select_department",
            addButtonText: "select_department",
            onSelectionChanged: (selectedIds) {
              
            },
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          const AvatarList(),
          SizedBox(height: 0.012 * Responsive.getHeight(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyCoButton(
                onTap: () {},
                title: LanguageManager().get('unselect_all'),
                textStyle: AppTheme.getTextStyle(context).labelMedium!.copyWith(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 12 * Responsive.getResponsiveText(context),
                ),
                width: 0.25 * Responsive.getWidth(context),
                height: 0.028 * Responsive.getHeight(context),
                boarderRadius: 20 * Responsive.getResponsive(context),
                isShadowBottomLeft: true,
              ),
              SizedBox(width: 0.01 * Responsive.getWidth(context)),
              MyCoButton(
                backgroundColor: AppTheme.getColor(context).secondary,
                borderColor: AppTheme.getColor(context).secondary,
                onTap: () {},
                title: LanguageManager().get('select_all'),
                textStyle: AppTheme.getTextStyle(context).labelMedium!.copyWith(
                  fontSize: 12 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).onPrimary,
                ),
                width: 0.25 * Responsive.getWidth(context),
                height: 0.028 * Responsive.getHeight(context),
                boarderRadius: 20 * Responsive.getResponsive(context),
                isShadowBottomLeft: true,
              ),
            ],
          ),
          SizedBox(height: 0.008 * Responsive.getHeight(context)),
          ProfileReportingCard(employeeList: departments),
          SizedBox(height: 0.01 * Responsive.getHeight(context)),

          MyCoButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (_) => CreatGroupBottomsheet(
                  headerHeight: 0.06 * Responsive.getHeight(context),

                  isHeaderRequired: true,
                  isButtonRequired: true,
                ),
              );
            },
            title: LanguageManager().get('add'),
            height: 0.055 * Responsive.getHeight(context),
            boarderRadius: 30,
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onPrimary,
            ),
            backgroundColor: AppTheme.getColor(context).primary,
            isShadowBottomLeft: true,
          ),

          SizedBox(height: 20 * Responsive.getResponsive(context)),

          // SizedBox(height: 20 * Responsive.getResponsive(context)),
        ],
      ),
    ),
  );
}

// MultiDepartmentSelector dropdown menu

// RemovableAvatar widget to remove an avatar

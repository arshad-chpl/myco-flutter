import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_multiselect_bottomsheet.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/select_employee.dart';
import 'package:myco_flutter/features/language_selector/model/language_response.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/custom_dropdown_menu.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class StartNewChat extends StatefulWidget {
  StartNewChat({super.key});

  @override
  State<StartNewChat> createState() => _StartNewChatState();
}

class _StartNewChatState extends State<StartNewChat> {
  final TextEditingController branchController = TextEditingController();

  Map<String, String> selectedDepartments = {};

  final List<Map<String, String>> departments = [
    {'id': '1', 'name': 'QA Sales'},
    {'id': '2', 'name': 'Product Team'},
    {'id': '3', 'name': 'Technical Support'},
    {'id': '4', 'name': 'Marketing'},
    {'id': '5', 'name': 'HR'},
  ];

  void _openDepartmentPicker() async {
   
    final selectedId = await showCustomSimpleBottomSheet(
      context: context,
      heading: 'Select Branch',
      icon: AssetImage('assets/chat/down_arrow.png'),
      dataList: departments,
    );
    log(selectedId.toString(), name: "selectedId");
    if (selectedId != null) {
      final selectedMap = departments.firstWhere(
        (e) => e['id'] == selectedId,
        orElse: () => {'id': '', 'name': ''},
      );

      if (selectedMap['id']!.isNotEmpty) {
        setState(() {
          selectedDepartments = selectedMap;
          branchController.text = selectedMap['name'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(title: 'chat'),
    body: Padding(
      padding:  EdgeInsetsGeometry.symmetric(horizontal: 22.0*Responsive.getResponsive(context)),//const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const CustomSearchField(
            hintText: 'search_employee',
            //  prefixIcon: Icons.search,
          ),
           SizedBox(height: 30 * Responsive.getResponsive(context)),
          NewTextField(
            controller: branchController,
            label: 'Branch',
            maxLines: 1,
            prefixIconPath: "",
            enabled: true,
            hintText: selectedDepartments.isEmpty
                ? LanguageManager().get('select_block')
                : selectedDepartments['name'] ?? '',
            suffixIconPath: 'assets/chat/chevron-down.svg',
            onTap: () => _openDepartmentPicker(),
          ),

           SizedBox(height: 16 * Responsive.getResponsive(context)),
          Expanded(
            child: GridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                top: 10 * Responsive.getResponsive(context),
                right: 10 * Responsive.getResponsive(context),
                bottom: 10 * Responsive.getResponsive(context),
                left: 10 * Responsive.getResponsive(context),
              ),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.getGridConfig(context).itemCount,
              mainAxisSpacing: Responsive.getGridConfig(context).spacing,
              crossAxisSpacing: Responsive.getGridConfig(context).spacing,
              childAspectRatio: 2 / 2.7,
              ),
              itemCount: 12, // example count
              itemBuilder: (context, index) => const StartNewChatProfileCard(
                name: 'Harshgiri Goswami',
                departments: 'QA Sales',
              ),
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    ),
  );
}

class StartNewChatProfileCard extends StatelessWidget {
  final String name;
  final String departments;
  final VoidCallback? onTap;
  const StartNewChatProfileCard({super.key, this.name = '' , this.departments = '' , this.onTap});

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap ?? () {
        context.pushNamed('user-chat');
      },
      child: Container(
        height: 0.28 * Responsive.getHeight(context),
        width: 0.3 * Responsive.getWidth(context),
        decoration: BoxDecoration(
          
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade300,
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
          border: Border.all(color: AppTheme.getColor(context).primary, width: 1),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            
            children: [
              SizedBox(height: 0.018 * Responsive.getHeight(context)),
              CircleAvatar(
                radius: 32 * Responsive.getResponsive(context),
                backgroundImage: const AssetImage(
                  'assets/chat/profile.jpg',
                ), // For assets, use AssetImage
                backgroundColor: AppTheme.getColor(context).onPrimary,
              ),
              SizedBox(height: 0.01 * Responsive.getHeight(context)),
              CustomText(
                textAlign:  TextAlign.center,
                name,
                fontWeight: FontWeight.w600,
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurface,
              ),
              CustomText(
                textAlign:  TextAlign.center,
                departments,
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurface,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

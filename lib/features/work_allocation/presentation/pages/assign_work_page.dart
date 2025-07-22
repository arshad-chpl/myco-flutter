import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/select_department.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_bloc.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_event.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_state.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/employee_details.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class AssignWorkPage extends StatelessWidget {
  AssignWorkPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final categoryController = TextEditingController();
  final srNoController = TextEditingController();
  final siteController = TextEditingController();
  final locationController = TextEditingController();
  final startDateController = TextEditingController();
  final targetDateController = TextEditingController();
  final remarkController = TextEditingController();

  final allEmployees = const [
    Employee(
      name: 'Rushda Baqui',
      role: 'iOS developer',
      imageUrl: 'https://example.com/avatar1.jpg',
    ),
    Employee(
      name: 'Shivangi Abhani',
      role: 'QA',
      imageUrl: 'https://example.com/avatar2.jpg',
    ),
    Employee(
      name: 'Bhakti Dalwadi',
      role: 'Flutter',
      imageUrl: 'https://example.com/avatar2.jpg',
    ),
    Employee(
      name: 'Shantanu Limje',
      role: 'QA',
      imageUrl: 'https://example.com/avatar2.jpg',
    ),
    Employee(
      name: 'Shantanu Limje',
      role: 'QA',
      imageUrl: 'https://example.com/avatar2.jpg',
    ),
    Employee(
      name: 'Demo',
      role: 'Flutter',
      imageUrl: 'https://example.com/avatar2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final pref = PreferenceManager();

      final companyId = await pref.getCompanyId() ?? '0';
      final languageId = await pref.getLanguageId() ?? '1';

      context.read<WorkAllocationBloc>().add(
        FetchWorkCategoryList(
          companyId: companyId,
          getWorkCategory: '1',
          languageId: languageId,
        ),
      );
    });

    return Scaffold(
      appBar: const CustomAppbar(title: 'Assign Work'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * Responsive.getResponsive(context),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 12 * Responsive.getResponsive(context),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<WorkAllocationBloc, WorkAllocationState>(
                builder: (context, state) {
                  final selectedCategory = context
                      .read<WorkAllocationBloc>()
                      .selectedCategory;
                  if (selectedCategory != null) {
                    categoryController.text = selectedCategory;
                  }

                  return NewTextField(
                    label: 'Category',
                    isRequired: true,
                    controller: categoryController,
                    hintText: 'Work Category',
                    prefixIconPath: AppAssets.element_1,
                    suffixIconPath: AppAssets.downArrow,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Select category'
                        : null,
                    onTap: () async {
                      if (state is WorkCategoryListLoaded) {
                        final categoriesName = state.categories
                            .map(
                              (e) => {
                                'id': e.workCategoryId ?? '',
                                'name': e.workCategoryName ?? '',
                              },
                            )
                            .toList();

                        final selectedName = await showCustomSimpleBottomSheet(
                          context: context,
                          heading: 'Work Category',
                          dataList: categoriesName,
                          selectedId: context
                              .read<WorkAllocationBloc>()
                              .selectedCategory,
                          searchHint: 'Search Category',
                          btnTitle: 'Select',
                        );

                        if (selectedName != null) {
                          context.read<WorkAllocationBloc>().add(
                            SelectWorkCategoryEvent(selectedName),
                          );
                        }
                      } else if (state is WorkAllocationLoading) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Loading categories...'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to load categories'),
                          ),
                        );
                      }
                    },

                    /*onTap: () async {
                      final categoriesName = [
                        {'id': 'Select', 'name': 'Select'},
                        {'id': 'Testing', 'name': 'Testing'},
                        {'id': 'AI Tools', 'name': 'AI Tools'},
                      ];

                      final selectedName = await showCustomSimpleBottomSheet(
                        context: context,
                        heading: 'Work Category',
                        dataList: categoriesName,
                        selectedId: context
                            .read<WorkAllocationBloc>()
                            .selectedCategory,
                        searchHint: 'Search Category',
                        btnTitle: 'Select',
                      );

                      if (selectedName != null) {
                        context.read<WorkAllocationBloc>().add(
                          SelectWorkCategoryEvent(selectedName),
                        );
                      }
                    },*/
                  );
                },
              ),

              //Project Sr No
              NewTextField(
                label: 'Project Sr No',
                isRequired: true,
                prefixIconPath: AppAssets.receiptEdittt,
                controller: srNoController,
                hintText: 'Type here',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter Project Sr No';
                  }
                  return null;
                },
              ),

              // Site
              NewTextField(
                label: 'Site',
                prefixIconPath: AppAssets.monitor,
                controller: siteController,
                isRequired: true,
                hintText: 'Type here',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter Site';
                  }
                  return null;
                },
              ),

              // Location
              NewTextField(
                label: 'Location',
                prefixIconPath: AppAssets.location1,
                controller: locationController,
                isRequired: true,
                hintText: 'Type here',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter Location';
                  }
                  return null;
                },
              ),

              // Start Date (DD/MM/YYYY)
              NewTextField(
                label: 'Start Date (DD/MM/YYYY)',
                prefixIconPath: AppAssets.assetNoteFavorite,
                controller: startDateController,
                isRequired: true,
                hintText: 'Select',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter Start Date';
                  }
                  return null;
                },
                onTap: () {},
              ),

              // Target Date of Completion (DD/MM/YYYY)
              NewTextField(
                label: 'Target Date of Completion (DD/MM/YYYY)',
                prefixIconPath: AppAssets.assetNoteFavorite,
                controller: targetDateController,
                isRequired: true,
                hintText: 'Select',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter Target Date';
                  }
                  return null;
                },
                onTap: () {},
              ),

              // Assign Engineer
              AssignEngineerField(allEmployees: allEmployees),

              // Remark
              NewTextField(
                controller: remarkController,
                label: 'Remark',
                hintText: 'Type here',
                prefixIconPath: AppAssets.msgedit,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20 * Responsive.getResponsive(context),
                  bottom: 50 * Responsive.getResponsive(context),
                ),
                child: MyCoButton(
                  title: 'Submit',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print('Form Validated');
                    }
                  },
                  backgroundColor: AppTheme.getColor(context).primary,
                  textStyle: TextStyle(
                    fontSize: 16 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  width: double.infinity,
                  isShadowBottomLeft: true,
                  boarderRadius: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

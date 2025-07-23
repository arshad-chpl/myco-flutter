import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_bloc.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_event.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_state.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/employee_details.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class AssignWorkPage extends StatefulWidget {
  AssignWorkPage({super.key});

  @override
  State<AssignWorkPage> createState() => _AssignWorkPageState();
}

class _AssignWorkPageState extends State<AssignWorkPage> {
  final _formKey = GlobalKey<FormState>();
  final categoryController = TextEditingController();
  final srNoController = TextEditingController();
  final siteController = TextEditingController();
  final locationController = TextEditingController();
  final startDateController = TextEditingController();
  final targetDateController = TextEditingController();
  final remarkController = TextEditingController();
  final engineerController = TextEditingController();
  final engineerFocusNode = FocusNode();

  final allEmployees = const [
    Employee(name: 'Rushda Baqui', role: 'iOS developer', imageUrl: ''),
    Employee(name: 'Shivangi Abhani', role: 'QA', imageUrl: ''),
    Employee(name: 'Bhakti Dalwadi', role: 'Flutter', imageUrl: ''),
    Employee(name: 'Shantanu Limje', role: 'QA', imageUrl: ''),
    Employee(name: 'Demo', role: 'Flutter', imageUrl: ''),
  ];

  int? _currentFieldErrorIndex;

  void _validateFieldByField() {
    final controllers = [
      categoryController,
      srNoController,
      siteController,
      locationController,
      startDateController,
      targetDateController,
    ];

    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].text.trim().isEmpty) {
        setState(() {
          _currentFieldErrorIndex = i;
        });
        _formKey.currentState!.validate();
        return;
      }
    }

    setState(() {
      _currentFieldErrorIndex = null;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final companyId = await PreferenceManager().getCompanyId() ?? "100";
      final languageId = await PreferenceManager().getLanguageId() ?? "100";

      context.read<WorkAllocationBloc>().add(
        FetchWorkCategoryList(
          companyId: companyId,
          getWorkCategory: 'getWorkCategory',
          languageId: languageId,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(title: 'Assign Work'),
    body: BlocListener<WorkAllocationBloc, WorkAllocationState>(
      listenWhen: (previous, current) => current is WorkCategoryListLoaded,
      listener: (context, state) {},
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal:
              VariableBag.screenHorizontalPadding *
              Responsive.getResponsive(context),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            spacing:
                VariableBag.textFieldRowGap * Responsive.getResponsive(context),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// CATEGORY FIELD
              BlocBuilder<WorkAllocationBloc, WorkAllocationState>(
                builder: (context, state) {
                  final bloc = context.read<WorkAllocationBloc>();
                  final selectedCategory = bloc.selectedCategory;

                  if (selectedCategory != null &&
                      categoryController.text != selectedCategory) {
                    categoryController.text = selectedCategory;
                  }

                  return NewTextField(
                    label: 'Category',
                    isRequired: true,
                    controller: categoryController,
                    hintText: 'Work Category',
                    prefixIconPath: AppAssets.element_1,
                    suffixIconPath: AppAssets.downArrow,
                    validator: (value) {
                      if (_currentFieldErrorIndex == 0 &&
                          (value == null || value.trim().isEmpty)) {
                        return 'Select category';
                      }
                      return null;
                    },
                    onTap: () async {
                      final companyId = await PreferenceManager()
                          .getCompanyId();
                      final languageId = await PreferenceManager()
                          .getLanguageId();

                      final currentState = context
                          .read<WorkAllocationBloc>()
                          .state;

                      if (currentState is WorkCategoryListLoaded &&
                          currentState.categories.isNotEmpty) {
                        final categoriesName = currentState.categories
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
                          selectedId: selectedCategory,
                          searchHint: 'Search Category',
                          btnTitle: 'Select',
                        );

                        if (selectedName != null &&
                            selectedName != selectedCategory) {
                          bloc.add(
                            SelectDynamicWorkCategoryEvent(selectedName),
                          );
                        }
                      } else {
                        bloc.add(
                          FetchWorkCategoryList(
                            getWorkCategory: 'getWorkCategory',
                            companyId: companyId!,
                            languageId: languageId!,
                          ),
                        );

                        await Future.delayed(const Duration(milliseconds: 500));

                        final newState = bloc.state;
                        if (newState is WorkCategoryListLoaded &&
                            newState.categories.isNotEmpty) {
                          final categoriesName = newState.categories
                              .map(
                                (e) => {
                                  'id': e.workCategoryId ?? '',
                                  'name': e.workCategoryName ?? '',
                                },
                              )
                              .toList();

                          final selectedName =
                              await showCustomSimpleBottomSheet(
                                context: context,
                                heading: 'Work Category',
                                dataList: categoriesName,
                                selectedId: selectedCategory,
                                searchHint: 'Search Category',
                                btnTitle: 'Select',
                              );

                          if (selectedName != null &&
                              selectedName != selectedCategory) {
                            bloc.add(
                              SelectDynamicWorkCategoryEvent(selectedName),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Categories not available'),
                            ),
                          );
                        }
                      }
                    },
                  );
                },
              ),

              /// OTHER FIELDS
              NewTextField(
                label: 'Project Sr No',
                isRequired: true,
                prefixIconPath: AppAssets.receiptEdittt,
                controller: srNoController,
                hintText: 'Type here',
                validator: (value) {
                  if (_currentFieldErrorIndex == 1 &&
                      (value == null || value.trim().isEmpty)) {
                    return 'Please enter Project Sr No';
                  }
                  return null;
                },
              ),
              NewTextField(
                label: 'Site',
                prefixIconPath: AppAssets.monitor,
                controller: siteController,
                isRequired: true,
                hintText: 'Type here',
                validator: (value) {
                  if (_currentFieldErrorIndex == 2 &&
                      (value == null || value.trim().isEmpty)) {
                    return 'Please enter Site';
                  }
                  return null;
                },
              ),
              NewTextField(
                label: 'Location',
                prefixIconPath: AppAssets.location1,
                controller: locationController,
                isRequired: true,
                hintText: 'Type here',
                validator: (value) {
                  if (_currentFieldErrorIndex == 3 &&
                      (value == null || value.trim().isEmpty)) {
                    return 'Please enter Location';
                  }
                  return null;
                },
              ),
              NewTextField(
                label: 'Start Date (DD/MM/YYYY)',
                prefixIconPath: AppAssets.assetNoteFavorite,
                controller: startDateController,
                isRequired: true,
                hintText: 'Select',
                validator: (value) {
                  if (_currentFieldErrorIndex == 4 &&
                      (value == null || value.trim().isEmpty)) {
                    return 'Please enter Start Date';
                  }
                  return null;
                },
                onTap: () {},
              ),
              NewTextField(
                label: 'Target Date of Completion (DD/MM/YYYY)',
                prefixIconPath: AppAssets.assetNoteFavorite,
                controller: targetDateController,
                isRequired: true,
                hintText: 'Select',
                validator: (value) {
                  if (_currentFieldErrorIndex == 5 &&
                      (value == null || value.trim().isEmpty)) {
                    return 'Please enter Target Date';
                  }
                  return null;
                },
                onTap: () {},
              ),

              /// ASSIGN ENGINEER
              AssignEngineerField(
                allEmployees: allEmployees,
                controller: engineerController,
                focusNode: engineerFocusNode,
              ),

              /// REMARK
              NewTextField(
                controller: remarkController,
                label: 'Remark',
                hintText: 'Type here',
                prefixIconPath: AppAssets.msgedit,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
              ),

              SizedBox(height: 0.010 * Responsive.getHeight(context)),

              MyCoButton(
                title: 'Submit',
                onTap: _validateFieldByField,
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
              SizedBox(height: 0.020 * Responsive.getHeight(context)),
            ],
          ),
        ),
      ),
    ),
  );
}

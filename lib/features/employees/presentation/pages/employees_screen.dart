import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/custom_appbar.dart';
import 'package:myco_flutter/features/employees/data/models/branch_model.dart';
import 'package:myco_flutter/features/employees/data/models/department_model.dart';
import 'package:myco_flutter/features/employees/data/models/employee_model.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/employee_card.dart';
import 'package:myco_flutter/widgets/custom_loader.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {'key': 'bmsapikey', 'Authorization': 'Basic MTozMEA0MDVAMQ=='},
      baseUrl: 'https://dev.my-company.app/india/residentApiNew/',
    ),
  );

  List<BranchModel> branches = [];
  List<DepartmentModel> departments = [];
  List<EmployeeModel> employees = [];

  BranchModel? selectedBranch;
  DepartmentModel? selectedDepartment;

  final String userId = '21';
  final String societyId = '1';

  bool isLoading = false;

  String searchQuery = '';
  final Set<int> selectedEmployeeIndexes = {};
  final TextEditingController branchController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeUserData();
  }

  Future<void> _initializeUserData() async {
    setState(() => isLoading = true);
    final formData = FormData.fromMap({
      'getEmployees': 'getEmployees',
      'language_id': '1',
      'user_id': userId,
      'society_id': societyId,
    });

    try {
      final response = await _dio.post(
        'employee_controller.php',
        data: formData,
      );
      final data = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      final List<BranchModel> fetchedBranches = (data['branch_list'] as List)
          .map((e) => BranchModel.fromJson(e))
          .toList();

      final List<DepartmentModel> fetchedDepartments =
          (data['departments'] as List)
              .map((e) => DepartmentModel.fromJson(e))
              .toList();

      final List<EmployeeModel> fetchedEmployees = (data['employees'] as List)
          .map((e) => EmployeeModel.fromJson(e))
          .toList();

      final currentUser = fetchedEmployees.firstWhere(
        (e) => e.userId == userId,
        orElse: () => fetchedEmployees.first,
      );
      final userDepartment = fetchedDepartments.firstWhere(
        (d) => d.floorId == currentUser.floorId,
        orElse: () => fetchedDepartments.first,
      );

      final userBranch = fetchedBranches.firstWhere(
        (b) => b.blockId == userDepartment.blockId,
        orElse: () => fetchedBranches.first,
      );

      setState(() {
        branches = fetchedBranches;
        departments = fetchedDepartments;
        employees = fetchedEmployees;
        selectedBranch = userBranch;
        selectedDepartment = userDepartment;
        branchController.text = userBranch.blockName;
        departmentController.text = userDepartment.departmentName;
      });
      _fetchData(
        blockId: userDepartment.blockId,
        floorId: userDepartment.floorId,
      );
    } catch (e) {
      debugPrint('Error initializing user data: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _fetchData({String? blockId, String? floorId}) async {
    setState(() => isLoading = true);
    final formData = FormData.fromMap({
      'getEmployees': 'getEmployees',
      'language_id': '1',
      'user_id': userId,
      'society_id': societyId,
      if (floorId != null) 'floor_id': floorId,
      if (blockId != null) 'block_id': blockId,
    });

    try {
      final response = await _dio.post(
        'employee_controller.php',
        data: formData,
      );
      final data = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      final List<EmployeeModel> allEmployees = (data['employees'] as List)
          .map((e) => EmployeeModel.fromJson(e))
          .toList();

      final filteredEmployees = allEmployees.where((e) {
        return e.blockId == blockId && e.floorId == floorId;
      }).toList();

      setState(() => employees = filteredEmployees);
    } catch (e) {
      debugPrint('Error fetching employees: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _onBranchChanged(BranchModel? branch) {
    setState(() {
      selectedBranch = branch;
      selectedDepartment = null;
      branchController.text = branch?.blockName ?? '';
      departmentController.text = '';
      searchQuery = '';
    });

    final branchDepartments = departments
        .where((d) => d.blockId == branch?.blockId)
        .toList();

    if (branchDepartments.isNotEmpty) {
      _onDepartmentChanged(branchDepartments.first);
    } else {
      setState(() => employees.clear());
    }
  }

  void _onDepartmentChanged(DepartmentModel? department) {
    setState(() {
      selectedDepartment = department;
      departmentController.text = department?.departmentName ?? '';
      searchQuery = '';
    });

    if (department != null) {
      _fetchData(blockId: department.blockId, floorId: department.floorId);
    }
  }

  void _onSearch(String query) {
    setState(() {
      searchQuery = query.trim().toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    final filteredDepartments = selectedBranch == null
        ? []
        : departments
              .where((d) => d.blockId == selectedBranch!.blockId)
              .toList();

    final List<EmployeeModel> filteredEmployees = searchQuery.isEmpty
        ? employees
        : employees.where((e) {
            return e.userFullName.toLowerCase().contains(searchQuery) ||
                e.designation.toLowerCase().contains(searchQuery);
          }).toList();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbar(
        title: CustomText(
          branchController.text.isEmpty ? 'branch' : branchController.text,
          isKey: true,
          fontSize: 18 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
        ),
        appBarBackgoundColor: AppTheme.getColor(context).surface,
        appbartxtcolor: AppTheme.getColor(context).onSurface,
      ),
      body: isLoading
          ? const Center(child: CustomLoader())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyCoTextfield(
                    prefix: SvgPicture.asset(
                      AppAssets.searchNormal,
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: 'search',
                    hintTextStyle: TextStyle(
                      fontSize: 14 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    textInputType: TextInputType.text,
                    textAlignment: TextAlign.left,
                    boarderRadius: 10,
                    contentPadding: EdgeInsets.all(
                      10 * Responsive.getResponsive(context),
                    ),
                    onChanged: _onSearch,
                  ),
                  SizedBox(height: Responsive.scaleHeight(16)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12 * Responsive.getResponsive(context),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final selectedId =
                                  await showCustomSimpleBottomSheet(
                                    context: context,
                                    heading: 'select_branch',
                                    icon: const AssetImage(AppAssets.downArrow),
                                    dataList: branches
                                        .map(
                                          (b) => {
                                            'id': b.blockId,
                                            'name': b.blockName,
                                          },
                                        )
                                        .toList(),
                                    selectedId: selectedBranch?.blockId,
                                  );

                              final branch = branches.firstWhere(
                                (b) => b.blockId == selectedId,
                                orElse: () => BranchModel.empty(),
                              );
                              if (branch.blockId.isNotEmpty)
                                _onBranchChanged(branch);
                            },
                            child: _buildDropdownBox(
                              context,
                              branchController.text.isEmpty
                                  ? 'select_branch'
                                  : branchController.text,
                            ),
                          ),
                        ),
                        SizedBox(width: Responsive.scaleWidth(12)),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final selectedId =
                                  await showCustomSimpleBottomSheet(
                                    context: context,
                                    heading: 'select_department',
                                    icon: const AssetImage(AppAssets.downArrow),
                                    dataList: filteredDepartments
                                        .map(
                                          (d) => {
                                            'id': d.floorId.toString(),
                                            'name': d.departmentName.toString(),
                                          },
                                        )
                                        .toList(),
                                    selectedId: selectedDepartment?.floorId,
                                  );

                              final dept = filteredDepartments.firstWhere(
                                (d) => d.floorId == selectedId,
                                orElse: () => DepartmentModel.empty(),
                              );
                              if (dept.floorId.isNotEmpty)
                                _onDepartmentChanged(dept);
                            },
                            child: _buildDropdownBox(
                              context,
                              departmentController.text.isEmpty
                                  ? 'select_department'
                                  : departmentController.text,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: filteredEmployees.isEmpty
                        ? const Center(child: Text('No employees found'))
                        : GridView.builder(
                            padding: const EdgeInsets.all(8),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: Responsive.getGridConfig(
                                    context,
                                  ).itemCount,
                                  mainAxisSpacing: Responsive.getGridConfig(
                                    context,
                                  ).spacing,
                                  crossAxisSpacing: Responsive.getGridConfig(
                                    context,
                                  ).spacing,
                                  childAspectRatio: Responsive.getGridConfig(
                                    context,
                                  ).childAspectRatio,
                                ),
                            itemCount: filteredEmployees.length,
                            itemBuilder: (context, index) {
                              final emp = filteredEmployees[index];
                              return EmployeeSelectionCard(
                                name: emp.userFullName,
                                department: emp.designation,
                                // image: NetworkImage(emp.userProfilePic),
                                image: NetworkImage(emp.userProfilePic),
                                isSelected: selectedEmployeeIndexes.contains(
                                  index,
                                ),
                                onSelected: (value) {
                                  final selectedEmployee =
                                      filteredEmployees[index];
                                  debugPrint(
                                    'Selected Employee: ${jsonEncode(selectedEmployee.toJson())}',
                                  );

                                  setState(() {
                                    if (selectedEmployeeIndexes.contains(
                                      index,
                                    )) {
                                      selectedEmployeeIndexes.remove(index);
                                    } else {
                                      selectedEmployeeIndexes.add(index);
                                    }
                                  });
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildDropdownBox(BuildContext context, String text) {
    final isWide = Responsive.screenWidth() > 600;
    final boxHeight = isWide ? 48.0 : 44 * Responsive.getResponsive(context);
    final horizontalPadding = isWide ? 16.0 : 10.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      height: boxHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        border: Border.all(color: AppTheme.getColor(context).outline),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomText(
              LanguageManager().get(text),
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              color: AppTheme.getColor(context).primary,
            ),
          ),
          Icon(
            CupertinoIcons.chevron_down,
            size: isWide ? 16 : 14 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).primary,
          ),
        ],
      ),
    );
  }
}

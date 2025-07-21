// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:myco_flutter/features/employees/data/models/branch_model.dart';
// import 'package:myco_flutter/features/employees/data/models/department_model.dart';
// import 'package:myco_flutter/features/employees/data/models/employee_model.dart';
//
// class EmployeesScreen extends StatefulWidget {
//   const EmployeesScreen({Key? key}) : super(key: key);
//
//   @override
//   State<EmployeesScreen> createState() => _EmployeesScreenState();
// }
//
// class _EmployeesScreenState extends State<EmployeesScreen> {
//   final Dio _dio = Dio(BaseOptions(
//     headers: {
//       'key': 'bmsapikey',
//       'Authorization': 'Basic MTozMEA0MDVAMQ==',
//     },
//     baseUrl: 'https://dev.my-company.app/india/residentApiNew/',
//   ));
//
//   List<BranchModel> branches = [];
//   List<DepartmentModel> departments = [];
//   List<EmployeeModel> employees = [];
//
//   BranchModel? selectedBranch;
//   DepartmentModel? selectedDepartment;
//
//   final String userId = '21';
//   final String societyId = '1';
//
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeUserData();
//   }
//
//   Future<void> _initializeUserData() async {
//     setState(() => isLoading = true);
//
//     final formData = FormData.fromMap({
//       'getEmployees': 'getEmployees',
//       'language_id': '1',
//       'user_id': userId,
//       'society_id': societyId,
//     });
//
//     try {
//       final response = await _dio.post('employee_controller.php', data: formData);
//       final data = response.data is String ? jsonDecode(response.data) : response.data;
//
//       final List<BranchModel> fetchedBranches = (data['branch_list'] as List)
//           .map((e) => BranchModel.fromJson(e))
//           .toList();
//
//       final List<DepartmentModel> fetchedDepartments = (data['departments'] as List)
//           .map((e) => DepartmentModel.fromJson(e))
//           .toList();
//
//       final List<EmployeeModel> fetchedEmployees = (data['employees'] as List)
//           .map((e) => EmployeeModel.fromJson(e))
//           .toList();
//
//       // Find the current user's department
//       final currentUser = fetchedEmployees.firstWhere((e) => e.userId == userId, orElse: () => fetchedEmployees.first);
//       final DepartmentModel? userDepartment = fetchedDepartments.firstWhere(
//             (d) => d.floorId == currentUser.floorId,
//         orElse: () => fetchedDepartments.first,
//       );
//
//       final BranchModel? userBranch = fetchedBranches.firstWhere(
//             (b) => b.blockId == userDepartment?.blockId,
//         orElse: () => fetchedBranches.first,
//       );
//
//       setState(() {
//         branches = fetchedBranches;
//         departments = fetchedDepartments;
//         employees = fetchedEmployees;
//         selectedBranch = userBranch;
//         selectedDepartment = userDepartment;
//       });
//
//       // Fetch employees again, filtered by the user's department
//       _fetchData(blockId: userDepartment?.blockId, floorId: userDepartment?.floorId);
//     } catch (e) {
//       debugPrint('Error initializing user data: $e');
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }
//
//   Future<void> _fetchData({String? blockId, String? floorId}) async {
//     setState(() => isLoading = true);
//
//     final formData = FormData.fromMap({
//       'getEmployees': 'getEmployees',
//       'language_id': '1',
//       'user_id': userId,
//       'society_id': societyId,
//       if (floorId != null) 'floor_id': floorId,
//       if (blockId != null) 'block_id': blockId,
//     });
//
//     try {
//       final response = await _dio.post('employee_controller.php', data: formData);
//       final data = response.data is String ? jsonDecode(response.data) : response.data;
//
//       final List<EmployeeModel> allEmployees = (data['employees'] as List)
//           .map((e) => EmployeeModel.fromJson(e))
//           .toList();
//
//       // ✅ Filter based on exact blockId and floorId match
//       final filteredEmployees = allEmployees.where((e) {
//         return e.blockId == blockId && e.floorId == floorId;
//       }).toList();
//
//       setState(() {
//         employees = filteredEmployees;
//       });
//     } catch (e) {
//       debugPrint('Error fetching employees: $e');
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }
//
//   void _onBranchChanged(BranchModel? branch) {
//     setState(() {
//       selectedBranch = branch;
//       selectedDepartment = null;
//     });
//
//     final branchDepartments = departments.where((d) => d.blockId == branch?.blockId).toList();
//
//     if (branchDepartments.isNotEmpty) {
//       _onDepartmentChanged(branchDepartments.first);
//     } else {
//       setState(() => employees.clear());
//     }
//   }
//
//   void _onDepartmentChanged(DepartmentModel? department) {
//     setState(() => selectedDepartment = department);
//     if (department != null) {
//       _fetchData(blockId: department.blockId, floorId: department.floorId);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final filteredDepartments = selectedBranch == null
//         ? []
//         : departments.where((d) => d.blockId == selectedBranch!.blockId).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Employees'),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Column(
//         children: [
//           const SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: DropdownButtonFormField<BranchModel>(
//               decoration: const InputDecoration(labelText: 'Select Branch'),
//               value: branches.contains(selectedBranch) ? selectedBranch : null,
//               items: branches.map((b) {
//                 return DropdownMenuItem<BranchModel>(
//                   value: b,
//                   child: Text(b.blockName),
//                 );
//               }).toList(),
//               onChanged: _onBranchChanged,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: DropdownButtonFormField<DepartmentModel>(
//               decoration: const InputDecoration(labelText: 'Select Department'),
//               value: filteredDepartments.contains(selectedDepartment) ? selectedDepartment : null,
//               items: filteredDepartments.map((d) {
//                 return DropdownMenuItem<DepartmentModel>(
//                   value: d,
//                   child: Text(d.departmentName),
//                 );
//               }).toList(),
//               onChanged: _onDepartmentChanged,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: employees.isEmpty
//                 ? const Center(child: Text('No employees found'))
//                 : GridView.builder(
//               padding: const EdgeInsets.all(16),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 3 / 2,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//               ),
//               itemCount: employees.length,
//               itemBuilder: (context, index) {
//                 final emp = employees[index];
//                 return Card(
//                   elevation: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircleAvatar(
//                           radius: 24,
//                           child: Text(emp.shortName),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(emp.userFullName, style: const TextStyle(fontWeight: FontWeight.bold)),
//                         Text(emp.designation),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// Media picker container
// // Padding(
// //   padding: const EdgeInsets.all(8.0),
// //   child: CustomMediaPickerContainer(
// //     title: 'Assets Image',
// //     titleFontSize: 14 * Responsive.getResponsiveText(context),
// //     imageTitle: 'Capture Image',
// //     // imageTitleSize: 10,
// //     // containerHeight: 100,
// //     multipleImage: 5,
// //     imagePath: AppAssets.assetGalleryExport,
// //     backgroundColor: Colors.blue.shade50,
// //     isCameraShow: true,
// //     isGalleryShow: true,
// //     isDocumentShow: true,
// //     isCropImage: true,
// //     onSelectedMedia: (files) {
// //       final paths = files.map((file) => file.path).toList();
// //       log('Selected file paths: $paths');
// //     },
// //   ),
// // ),
// ///Punch in-out Stepper
// // const Text('Punch in-out Demo'),
// // Expanded(
// //   child: SingleChildScrollView(
// //     child: CustomVerticalStepper(
// //       steps: [
// //         StepData(
// //           title: 'PUNCH IN',
// //           // title: '',
// //           subTitle: '10:25:06 AM',
// //           subTitleFontSize: 20,
// //           status: StepStatus.inActive,
// //           // isStepIconShow: false,
// //           customStatusIcon: SvgPicture.asset(
// //             AppAssets.assetGalleryExport,
// //           ),
// //           // customStatusIcon: const Icon(
// //           //   Icons.ac_unit,
// //           //   color: Colors.white,
// //           // ),
// //           details: [
// //             StepDetail(title: 'title', description: 'description'),
// //             StepDetail(
// //               title: 'Completion Remark',
// //               description: 'description',
// //             ),
// //           ],
// //           subSteps: [
// //             SubStepData(
// //               subStepTitle: 'Lunch Break',
// //               subStepSubTitle: '01:32:56 PM - 02:01:46 PM',
// //               subStepTrailingTitle: '28 min 50 sec',
// //               subStepStatus: StepStatus.pending,
// //               subStepCustomStatusIcon: Icon(Icons.lunch_dining),
// //               subStepSubTitleFontSize: 20,
// //               isSubStepIconShow: false,
// //             ),
// //             SubStepData(
// //               subStepTitle: 'Tea Break',
// //               subStepSubTitle: '06:05:02 PM - 06:07:51 PM',
// //               subStepTrailingTitle: '2 min 49 sec',
// //               subStepStatus: StepStatus.pending,
// //               // isSubStepIconShow: false,
// //             ),
// //           ],
// //         ),
// //         StepData(
// //           title: 'PUNCH OUT',
// //           subTitle: '06:08:39 PM',
// //           trillingTitle: '7 hour 43 min 33 sec',
// //           status: StepStatus.pending,
// //           // isStepIconShow: false,
// //         ),
// //         StepData(
// //           title: 'PUNCH IN & OUT',
// //           subTitle: '06:08:39 PM',
// //           trillingTitle: '1 min 18 sec',
// //           status: StepStatus.approved,
// //           // isStepIconShow: true,
// //         ),
// //       ],
// //     ),
// //   ),
// // ),


import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
 
Future<dynamic> showCustomSimpleBottomSheet({
  required BuildContext context,
  required List<Map<String, String>> dataList,
  required String heading,
  String? selectedId,
  ImageProvider? icon,
  String? searchHint,
  String? btnTitle,
  bool isMultipleSelection = false,
}) =>
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CustomSimpleBottomSheet(
        heading: heading,
        dataList: dataList,
        selectedId: selectedId,
        icon: icon,
        searchHint: searchHint,
        btnTitle: btnTitle,
        isMultipleSelection: isMultipleSelection,
      ),
    );
 
class _CustomSimpleBottomSheet extends StatefulWidget {
  final List<Map<String, String>> dataList;
  final String heading;
  final String? selectedId;
  final String? searchHint;
  final String? btnTitle;
  final ImageProvider? icon;
  final bool isMultipleSelection;
 
  const _CustomSimpleBottomSheet({
    required this.dataList,
    required this.heading,
    this.selectedId,
    this.searchHint,
    this.btnTitle,
    this.icon,
    this.isMultipleSelection = false,
  });
 
  @override
  State<_CustomSimpleBottomSheet> createState() =>
      _CustomSimpleBottomSheetState();
}
 
class _CustomSimpleBottomSheetState extends State<_CustomSimpleBottomSheet> {
  String searchQuery = '';
  String? selectedItemId;
  List<String> selectedItemIds = [];
  late List<Map<String, String>> filteredList;
  bool isAllSelected = false;
 
  @override
  void initState() {
    super.initState();
    selectedItemId = widget.selectedId;
    filteredList = List.from(widget.dataList);
 
    if (widget.selectedId != null) {
      selectedItemIds = [widget.selectedId!];
    }
  }
 
  void _onSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredList = widget.dataList
          .where((item) =>
          (item['name'] ?? '').toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
 
  void _toggleSelection(String id) {
    setState(() {
      if (selectedItemIds.contains(id)) {
        selectedItemIds.remove(id);
        isAllSelected = false;
      } else {
        selectedItemIds.add(id);
        if (selectedItemIds.length == filteredList.length) {
          isAllSelected = true;
        }
      }
    });
  }
 
  void _selectAll() {
    if (isAllSelected) {
      setState(() {
        selectedItemIds.clear();
        isAllSelected = false;
      });
    } else {
      final allIds = filteredList.map((e) => e['id']!).toList();
      setState(() {
        selectedItemIds = allIds;
        isAllSelected = true;
      });
    }
  }
 
  @override
  Widget build(BuildContext context) => Container(
    height: Responsive.getHeight(context) * 0.625,
    width: Responsive.getWidth(context),
    padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
 
        // Title and close icon
        Row(
          children: [
            if (widget.heading.isNotEmpty)
              Expanded(
                child: CustomText(
                  LanguageManager().get(widget.heading),
                  fontWeight: FontWeight.w700,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  color: AppColors.textPrimary,
                ),
              ),
            if (widget.icon != null)
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: widget.icon!,
                    width: 0.04 * Responsive.getWidth(context),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
 
        SizedBox(height: 12 * Responsive.getResponsive(context)),
 
        // Search field
        MyCoTextfield(
          prefix:
          Image.asset('assets/take_order/search-normal.png', scale: 20),
          hintText: widget.searchHint ?? 'Search',
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
 
        SizedBox(height: 12 * Responsive.getResponsive(context)),
 
        // "Select All" button
        if (widget.isMultipleSelection && filteredList.length > 1)
          InkWell(
            onTap: _selectAll,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 6 * Responsive.getResponsive(context),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10 * Responsive.getResponsive(context),
                horizontal: 16 * Responsive.getResponsive(context),
              ),
              decoration: BoxDecoration(
                color: isAllSelected
                    ? AppTheme.getColor(context).surfaceContainer
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                  AppTheme.getColor(context).primary.withOpacity(0.3),
                ),
              ),
              child: Center(
                child: CustomText(
                  isAllSelected ? 'Unselect All' : 'Select All',
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontSize: 14 * Responsive.getResponsiveText(context),
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
 
        // List of items
        Expanded(
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final item = filteredList[index];
              final id = item['id'];
              final name = item['name'] ?? '';
 
              if (id == null || name.isEmpty) return const SizedBox.shrink();
 
              final isSelected = widget.isMultipleSelection
                  ? selectedItemIds.contains(id)
                  : id == selectedItemId;
 
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 6 * Responsive.getResponsive(context),
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.getColor(context).primary
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.getColor(context)
                        .primary
                        .withOpacity(0.3),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    if (widget.isMultipleSelection) {
                      _toggleSelection(id);
                    } else {
                      setState(() {
                        selectedItemId = id;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10 * Responsive.getResponsive(context),
                      horizontal: 16 * Responsive.getResponsive(context),
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.getColor(context).surfaceContainer
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: CustomText(
                      name,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * Responsive.getResponsiveText(context),
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
 
        SizedBox(height: Responsive.getResponsive(context) * 0.16),
 
        // Submit button
        MyCoButton(
          title: LanguageManager().get(widget.btnTitle ?? 'Submit'),
          boarderRadius: 50,
          height: 0.05 * Responsive.getHeight(context),
          isShadowBottomLeft: true,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          onTap: () {
            if (widget.isMultipleSelection) {
              Navigator.pop(context, selectedItemIds);
            } else if (selectedItemId != null) {
              Navigator.pop(context, selectedItemId!);
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ],
    ),
  );
}
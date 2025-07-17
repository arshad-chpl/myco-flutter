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

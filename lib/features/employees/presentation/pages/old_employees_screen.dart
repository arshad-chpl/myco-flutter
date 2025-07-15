// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:myco_flutter/constants/app_assets.dart';
// import 'package:myco_flutter/core/theme/app_theme.dart';
// import 'package:myco_flutter/core/theme/colors.dart';
// import 'package:myco_flutter/core/utils/language_manager.dart';
// import 'package:myco_flutter/core/utils/responsive.dart';
// import 'package:myco_flutter/features/asset/widgets/custom_appbar.dart';
// import 'package:myco_flutter/features/employees/presentation/widgets/employee_card.dart';
// import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
// import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
// import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
// import 'package:myco_flutter/widgets/custom_text.dart';
// import 'package:myco_flutter/widgets/custom_text_field.dart';
// import 'package:myco_flutter/widgets/custom_vertical_stepper.dart';
//
// class EmployeesScreen extends StatefulWidget {
//   const EmployeesScreen({super.key});
//
//   @override
//   State<EmployeesScreen> createState() => _EmployeesScreenState();
// }
//
// class _EmployeesScreenState extends State<EmployeesScreen> {
//   final TextEditingController branchController = TextEditingController();
//   final TextEditingController departmentController = TextEditingController();
//   final Set<int> selectedEmployeeIndexes = {};
//
//   final List<Map<String, String>> branches = [
//     {'id': '1', 'name': 'Ahmedabad'},
//     {'id': '2', 'name': 'Surat'},
//     {'id': '3', 'name': 'Vadodara'},
//     {'id': '4', 'name': 'Rajkot'},
//     {'id': '5', 'name': 'Bhavnagar'},
//     {'id': '6', 'name': 'Jamnagar'},
//     {'id': '7', 'name': 'Gandhinagar'},
//     {'id': '8', 'name': 'Junagadh'},
//     {'id': '9', 'name': 'Anand'},
//     {'id': '10', 'name': 'Nadiad'},
//   ];
//
//   final List<Map<String, String>> departments = [
//     {'id': '1', 'name': 'QA Sales'},
//     {'id': '2', 'name': 'Product Team'},
//     {'id': '3', 'name': 'Technical Support'},
//     {'id': '4', 'name': 'Marketing'},
//     {'id': '5', 'name': 'HR'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     Responsive.init(context);
//     final employees = List.generate(
//       25,
//           (index) => {
//         'name': 'Aadi K',
//         'role': 'QA',
//         'image': 'https://i.pravatar.cc/150?img=${index + 1}',
//       },
//     );
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: CustomAppbar(
//         // leading: const Icon(CupertinoIcons.arrow_left, size: 20),
//         title: CustomText(
//           branchController.text.isEmpty ? 'branch' : branchController.text,
//           isKey: true,
//           fontSize: 18 * Responsive.getResponsiveText(context),
//           fontWeight: FontWeight.w700,
//         ),
//         appBarBackgoundColor: AppTheme.getColor(context).surface,
//         appbartxtcolor: AppTheme.getColor(context).onSurface,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             MyCoTextfield(
//               prefix: Image.asset(
//                 'assets/take_order/search-normal.png',
//                 scale: 20,
//               ),
//               hintText: 'search',
//               maxLines: 1,
//               hintTextStyle: TextStyle(
//                 fontSize: 14 * Responsive.getResponsiveText(context),
//                 fontWeight: FontWeight.w600,
//               ),
//               textAlignment: TextAlign.left,
//               boarderRadius: 10,
//               contentPadding: const EdgeInsets.all(10),
//             ),
//             SizedBox(height: Responsive.scaleHeight(16)),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 vertical: 12 * Responsive.getResponsive(context),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () async {
//                         final selectedId = await showCustomSimpleBottomSheet(
//                           context: context,
//                           heading: 'select_branch',
//                           // isKey: true,
//                           icon: const AssetImage(AppAssets.downArrow),
//                           dataList: branches,
//                         );
//                         if (selectedId != null) {
//                           final selectedMap = branches.firstWhere(
//                                 (e) => e['id'] == selectedId,
//                             orElse: () => {'id': '', 'name': ''},
//                           );
//                           setState(() {
//                             branchController.text = selectedMap['name'] ?? '';
//                           });
//                         }
//                       },
//                       child: _buildDropdownBox(
//                         context,
//                         (branchController.text.isEmpty
//                             ? 'select_branch'
//                             : branchController.text),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: Responsive.scaleWidth(12)),
//                   // spacing between dropdowns
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () async {
//                         final selectedId = await showCustomSimpleBottomSheet(
//                           context: context,
//                           heading: 'select_department',
//                           dataList: departments,
//                           icon: const AssetImage(
//                             'assets/employees/down_arrow.png',
//                           ),
//                           btnTitle: 'crm_submit',
//                         );
//                         if (selectedId != null) {
//                           final selectedMap = departments.firstWhere(
//                                 (e) => e['id'] == selectedId,
//                             orElse: () => {'id': '', 'name': ''},
//                           );
//                           setState(() {
//                             departmentController.text =
//                                 selectedMap['name'] ?? '';
//                           });
//                         }
//                       },
//                       child: _buildDropdownBox(
//                         context,
//                         departmentController.text.isEmpty
//                             ? 'select_department'
//                             : departmentController.text,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Text('Punch in-out Demo'),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: CustomVerticalStepper(
//                   steps: [
//                     StepData(
//                       title: 'PUNCH IN',
//                       // title: '',
//                       subTitle: '10:25:06 AM',
//                       subTitleFontSize: 20,
//                       status: StepStatus.inActive,
//                       // isStepIconShow: false,
//                       customStatusIcon: SvgPicture.asset(
//                         AppAssets.assetGalleryExport,
//                       ),
//                       // customStatusIcon: const Icon(
//                       //   Icons.ac_unit,
//                       //   color: Colors.white,
//                       // ),
//                       details: [
//                         StepDetail(title: 'title', description: 'description'),
//                         StepDetail(
//                           title: 'Completion Remark',
//                           description: 'description',
//                         ),
//                       ],
//                       subSteps: [
//                         SubStepData(
//                           subStepTitle: 'Lunch Break',
//                           subStepSubTitle: '01:32:56 PM - 02:01:46 PM',
//                           subStepTrailingTitle: '28 min 50 sec',
//                           subStepStatus: StepStatus.pending,
//                           subStepCustomStatusIcon: Icon(Icons.lunch_dining),
//                           subStepSubTitleFontSize: 20,
//                           isSubStepIconShow: false,
//                         ),
//                         SubStepData(
//                           subStepTitle: 'Tea Break',
//                           subStepSubTitle: '06:05:02 PM - 06:07:51 PM',
//                           subStepTrailingTitle: '2 min 49 sec',
//                           subStepStatus: StepStatus.pending,
//                           // isSubStepIconShow: false,
//                         ),
//                       ],
//                     ),
//                     StepData(
//                       title: 'PUNCH OUT',
//                       subTitle: '06:08:39 PM',
//                       trillingTitle: '7 hour 43 min 33 sec',
//                       status: StepStatus.pending,
//                       // isStepIconShow: false,
//                     ),
//                     StepData(
//                       title: 'PUNCH IN & OUT',
//                       subTitle: '06:08:39 PM',
//                       trillingTitle: '1 min 18 sec',
//                       status: StepStatus.approved,
//                       // isStepIconShow: true,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDropdownBox(BuildContext context, String text) {
//     final isWide = Responsive.screenWidth() > 600;
//     final boxHeight = isWide ? 48.0 : 44 * Responsive.getResponsive(context);
//     final horizontalPadding = isWide ? 16.0 : 10.0;
//
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//       height: boxHeight,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: AppColors.white,
//         border: Border.all(color: AppTheme.getColor(context).outline),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: CustomText(
//               LanguageManager().get(text),
//               fontSize: 14 * Responsive.getResponsiveText(context),
//               fontWeight: FontWeight.w600,
//               textAlign: TextAlign.left,
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//               color: AppTheme.getColor(context).primary,
//             ),
//           ),
//           Icon(
//             CupertinoIcons.chevron_down,
//             size: isWide ? 16 : 14 * Responsive.getResponsiveText(context),
//             color: AppTheme.getColor(context).primary,
//           ),
//         ],
//       ),
//     );
//   }
// }


/// Employee List
// Expanded(
//   child: GridView.builder(
//     padding: const EdgeInsets.only(
//       top: 6,
//       bottom: 5,
//       left: 5,
//       right: 5,
//     ),
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: Responsive.getGridConfig(
//         context,
//         // isBottomSheet: false,
//       ).itemCount,
//       mainAxisSpacing: Responsive.getGridConfig(context).spacing,
//       crossAxisSpacing: Responsive.getGridConfig(context).spacing,
//       childAspectRatio: Responsive.getGridConfig(
//         context,
//       ).childAspectRatio,
//     ),
//     itemCount: employees.length,
//     itemBuilder: (context, index) {
//       final emp = employees[index];
//       return EmployeeSelectionCard(
//         name: emp['name']!,
//         department: emp['role']!,
//         image: NetworkImage(emp['image']!),
//         showDelete: true,
//         // selectedColor: Colors.red,
//         isSelected: selectedEmployeeIndexes.contains(index),
//         onSelected: (value) {
//           setState(() {
//             if (selectedEmployeeIndexes.contains(index)) {
//               selectedEmployeeIndexes.remove(index);
//             } else {
//               selectedEmployeeIndexes.add(index);
//             }
//           });
//         },
//       );
//     },
//   ),
// ),

/// Media picker container
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: CustomMediaPickerContainer(
//     title: 'Assets Image',
//     titleFontSize: 14 * Responsive.getResponsiveText(context),
//     imageTitle: 'Capture Image',
//     // imageTitleSize: 10,
//     // containerHeight: 100,
//     multipleImage: 5,
//     imagePath: AppAssets.assetGalleryExport,
//     backgroundColor: Colors.blue.shade50,
//     isCameraShow: true,
//     isGalleryShow: true,
//     isDocumentShow: true,
//     isCropImage: true,
//     onSelectedMedia: (files) {
//       final paths = files.map((file) => file.path).toList();
//       log('Selected file paths: $paths');
//     },
//   ),
// ),
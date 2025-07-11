import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/custom_appbar.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/employee_card.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:myco_flutter/widgets/custom_vertical_stepper.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final TextEditingController branchController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final Set<int> selectedEmployeeIndexes = {};

  final List<Map<String, String>> branches = [
    {'id': '1', 'name': 'Ahmedabad'},
    {'id': '2', 'name': 'Surat'},
    {'id': '3', 'name': 'Vadodara'},
    {'id': '4', 'name': 'Rajkot'},
    {'id': '5', 'name': 'Bhavnagar'},
    {'id': '6', 'name': 'Jamnagar'},
    {'id': '7', 'name': 'Gandhinagar'},
    {'id': '8', 'name': 'Junagadh'},
    {'id': '9', 'name': 'Anand'},
    {'id': '10', 'name': 'Nadiad'},
  ];

  final List<Map<String, String>> departments = [
    {'id': '1', 'name': 'QA Sales'},
    {'id': '2', 'name': 'Product Team'},
    {'id': '3', 'name': 'Technical Support'},
    {'id': '4', 'name': 'Marketing'},
    {'id': '5', 'name': 'HR'},
  ];

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    final employees = List.generate(
      25,
      (index) => {
        'name': 'Aadi K',
        'role': 'QA',
        'image': 'https://i.pravatar.cc/150?img=${index + 1}',
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbar(
        leading: const Icon(CupertinoIcons.arrow_left, size: 20),
        title: CustomText(
          branchController.text.isEmpty ? 'branch' : branchController.text,
          fontSize: 18 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
        ),
        appBarBackgoundColor: AppTheme.getColor(context).surface,
        appbartxtcolor: AppTheme.getColor(context).onSurface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCoTextfield(
              prefix: Image.asset(
                'assets/take_order/search-normal.png',
                scale: 20,
              ),
              hintText: 'Search',
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w600,
              ),
              textAlignment: TextAlign.left,
              boarderRadius: 10,
              contentPadding: const EdgeInsets.all(10),
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
                        final selectedId = await showCustomSimpleBottomSheet(
                          context: context,
                          heading: 'Select Branch',
                          icon: const AssetImage(AppAssets.downArrow),
                          dataList: branches,
                        );
                        if (selectedId != null) {
                          final selectedMap = branches.firstWhere(
                            (e) => e['id'] == selectedId,
                            orElse: () => {'id': '', 'name': ''},
                          );
                          setState(() {
                            branchController.text = selectedMap['name'] ?? '';
                          });
                        }
                      },
                      child: _buildDropdownBox(
                        context,
                        branchController.text.isEmpty
                            ? 'Select Branch'
                            : branchController.text,
                      ),
                    ),
                  ),
                  SizedBox(width: Responsive.scaleWidth(12)),
                  // spacing between dropdowns
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final selectedId = await showCustomSimpleBottomSheet(
                          context: context,
                          heading: 'Select Department',
                          dataList: departments,
                          icon: const AssetImage(
                            'assets/employees/down_arrow.png',
                          ),
                          btnTitle: 'Submit',
                        );
                        if (selectedId != null) {
                          final selectedMap = departments.firstWhere(
                            (e) => e['id'] == selectedId,
                            orElse: () => {'id': '', 'name': ''},
                          );
                          setState(() {
                            departmentController.text =
                                selectedMap['name'] ?? '';
                          });
                        }
                      },
                      child: _buildDropdownBox(
                        context,
                        departmentController.text.isEmpty
                            ? 'Select Department'
                            : departmentController.text,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // const Text('Punch in-out Demo'),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: CustomVerticalStepper(
            //       steps: [
            //         StepData(
            //           title: 'PUNCH IN',
            //           // title: '',
            //           subTitle: '10:25:06 AM',
            //           status: StepStatus.pending,
            //           // isStepIconShow: false,
            //           customStatusIcon: const Icon(
            //             Icons.ac_unit,
            //             color: Colors.white,
            //           ),
            //           subSteps: [
            //             SubStepData(
            //               title: 'Lunch Break',
            //               subTitle: '01:32:56 PM - 02:01:46 PM',
            //               trailingTitle: '28 min 50 sec',
            //               status: StepStatus.pending,
            //               // customStatusIcon: Icon(Icons.lunch_dining),
            //               // isSubStepIconShow: false,
            //             ),
            //             SubStepData(
            //               title: 'Tea Break',
            //               subTitle: '06:05:02 PM - 06:07:51 PM',
            //               trailingTitle: '2 min 49 sec',
            //               status: StepStatus.pending,
            //               // isSubStepIconShow: false,
            //             ),
            //           ],
            //         ),
            //         StepData(
            //           title: 'PUNCH OUT',
            //           subTitle: '06:08:39 PM',
            //           trillingTitle: '7 hour 43 min 33 sec',
            //           status: StepStatus.pending,
            //           // isStepIconShow: false,
            //         ),
            //         StepData(
            //           title: 'PUNCH IN & OUT',
            //           subTitle: '06:08:39 PM',
            //           trillingTitle: '1 min 18 sec',
            //           status: StepStatus.approved,
            //           // isStepIconShow: false,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // /// Employee List
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(
                  top: 6,
                  bottom: 5,
                  left: 5,
                  right: 5,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.getGridConfig(
                    context,
                    // isBottomSheet: false,
                  ).itemCount,
                  mainAxisSpacing: Responsive.getGridConfig(context).spacing,
                  crossAxisSpacing: Responsive.getGridConfig(context).spacing,
                  childAspectRatio: Responsive.getGridConfig(
                    context,
                  ).childAspectRatio,
                ),
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final emp = employees[index];
                  return EmployeeSelectionCard(
                    name: emp['name']!,
                    department: emp['role']!,
                    image: NetworkImage(emp['image']!),
                    showDelete: true,
                    // selectedColor: Colors.red,
                    isSelected: selectedEmployeeIndexes.contains(index),
                    onSelected: (value) {
                      setState(() {
                        if (selectedEmployeeIndexes.contains(index)) {
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

            // CommonCard(
            //   title: 'Reporting Person',
            //   bottomWidget: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Expanded(
            //         child: GridView.builder(
            //           padding: const EdgeInsets.only(
            //             top: 6,
            //             bottom: 5,
            //             left: 5,
            //             right: 5,
            //           ),
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: Responsive.getGridConfig(
            //               context,
            //             ).itemCount,
            //             mainAxisSpacing: Responsive.getGridConfig(
            //               context,
            //             ).spacing,
            //             crossAxisSpacing: Responsive.getGridConfig(
            //               context,
            //             ).spacing,
            //             childAspectRatio: Responsive.getGridConfig(
            //               context,
            //             ).childAspectRatio,
            //           ),
            //           itemCount: 3,
            //           itemBuilder: (context, index) =>
            //               const EmployeeSelectionCard(
            //                 image: AssetImage(
            //                   'assets/dashboard/person_photo.png',
            //                 ),
            //                 name: 'Ajit Maurya',
            //                 department: 'QA',
            //                 isSelected: false,
            //               ),
            //           shrinkWrap: true,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomMediaPickerContainer(
                title: 'Assets Image',
                titleFontSize: 14,
                imageTitle: 'Capture Image',
                containerHeight: 100,
                multipleImage: 5,
                imagePath: 'assets/media_picker/gallery-export.png',
                backgroundColor: Colors.blue.shade50,
                isCameraShow: true,
                isGalleryShow: true,
                isDocumentShow: true,
                isCropImage: true,
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
            child: Text(
              text,
              style: _typingStyle(context),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
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

  TextStyle _typingStyle(BuildContext context) => TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 14 * Responsive.getResponsiveText(context),
    color: AppTheme.getColor(context).primary,
  );
}

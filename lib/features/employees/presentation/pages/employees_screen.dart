import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/custom_appbar.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/employee_card.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final TextEditingController branchController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  List<Map<String, String>> branches = [];
  List<Map<String, String>> departments = [];

  bool isBranchLoading = true;
  bool isDepartmentLoading = true;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      branches = [
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
      isBranchLoading = false;
    });

    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      departments = [
        {'id': '1', 'name': 'QA Sales'},
        {'id': '2', 'name': 'Product Team'},
        {'id': '3', 'name': 'Technical Support'},
        {'id': '4', 'name': 'Marketing'},
        {'id': '5', 'name': 'HR'},
      ];
      isDepartmentLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Sample data list
    final employees = List.generate(
      20,
      (index) => {
        'name': 'Aadi K',
        'role': 'QA',
        'image': 'https://i.pravatar.cc/150?img=${index + 1}', // Sample avatars
      },
    );
    return Scaffold(
      appBar: CustomAppbar(
        leading: const Icon(CupertinoIcons.arrow_left, size: 20),
        title: CustomText(
          branchController.text.isEmpty ? 'Branch' : branchController.text,
          fontSize: 18 * getResponsiveText(context),
          fontWeight: FontWeight.w700,
        ),
        appBarBackgoundColor: AppTheme.getColor(context).surface,
        appbartxtcolor: AppTheme.getColor(context).onSurface,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyCoTextfield(
              prefix: Image.asset(
                'assets/take_order/search-normal.png',
                scale: 20,
              ),
              hintText: 'Search',
              hintTextStyle: TextStyle(
                fontSize: 14 * getResponsiveText(context),
                fontWeight: FontWeight.w600,
              ),
              textAlignment: TextAlign.left,
              boarderRadius: 10,
              contentPadding: const EdgeInsets.all(10),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12 * getResponsive(context),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        if (isBranchLoading) return;
                        final selectedId = await CustomSimpleBottomSheet.show(
                          context,
                          title: 'Select Branch',
                          items: branches,
                          selectedItem: branches.firstWhere(
                            (b) => b['name'] == branchController.text,
                            orElse: () => {'id': '', 'name': ''},
                          )['id'],
                          image: const AssetImage(
                            'assets/employees/down_arrow.png',
                          ),
                          onSelect: (selectedId) {
                            final selected = branches.firstWhere(
                              (e) => e['id'] == selectedId,
                            );
                            branchController.text = selected['name']!;
                            setState(() {});
                          },
                        );
                        if (kDebugMode) {
                          print('selectedIdOfBranch:--------$selectedId');
                        }
                      },
                      child: _buildDropdownBox(
                        context,
                        branchController.text.isEmpty
                            ? 'Select Branch'
                            : branchController.text,
                        isBranchLoading,
                      ),
                    ),
                  ),
                  SizedBox(width: getWidth(context) * 0.015),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        if (isDepartmentLoading) return;
                        final selectedId = await CustomSimpleBottomSheet.show(
                          context,
                          title: 'Select Department',
                          items: departments,
                          selectedItem: departments.firstWhere(
                            (d) => d['name'] == departmentController.text,
                            orElse: () => {'id': '', 'name': ''},
                          )['id'],
                          image: const AssetImage(
                            'assets/employees/down_arrow.png',
                          ),
                          btnTitle: 'Submit',
                          onSelect: (selectedId) {
                            final selected = departments.firstWhere(
                              (e) => e['id'] == selectedId,
                            );
                            departmentController.text = selected['name']!;
                            setState(() {});
                          },
                        );
                        if (kDebugMode) {
                          print('selectedIdOfDepartment:--------$selectedId');
                        }
                      },
                      child: _buildDropdownBox(
                        context,
                        departmentController.text.isEmpty
                            ? 'Select Department'
                            : departmentController.text,
                        isDepartmentLoading,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const PageScrollPhysics(),
                padding: const EdgeInsets.only(top: 10, left: 1),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = getWidth(context) > 600 ? 4 : 3;
                    final spacing = 12.0 * getResponsive(context);
                    final cardWidth =
                        (constraints.maxWidth -
                            (spacing * (crossAxisCount - 1))) /
                        crossAxisCount;

                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: employees
                          .map(
                            (emp) => SizedBox(
                              width: cardWidth,
                              child: EmployeeCard(
                                name: emp['name']!,
                                role: emp['role']!,
                                imageUrl: emp['image']!,
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownBox(BuildContext context, String text, bool isLoading) =>
      Container(
        padding: const EdgeInsets.all(10),
        height: 44 * getResponsive(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          border: Border.all(color: AppTheme.getColor(context).outline),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppTheme.getColor(context).primary,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: _typingStyle(context),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 14 * getResponsiveText(context),
                    color: AppTheme.getColor(context).primary,
                  ),
                ],
              ),
      );

  TextStyle _typingStyle(BuildContext context) => TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 14 * getResponsiveText(context),
    color: AppTheme.getColor(context).primary,
  );
}

// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: CustomMediaPickerContainer(
//     title: 'Assets Image',
//     titleFontSize: 14,
//     imageTitle: 'Capture Image',
//     containerHeight: 100,
//     multipleImage: 5,
//     imagePath: 'assets/media_picker/gallery-export.png',
//     backgroundColor: Colors.blue.shade50,
//     isCameraShow: true,
//     isGalleryShow: true,
//     isDocumentShow: true,
//     isCropImage: true,
//   ),
// ),

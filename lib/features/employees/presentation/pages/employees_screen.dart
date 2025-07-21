import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/asset/widgets/cached_image_holder.dart';
import 'package:myco_flutter/features/employees/domain/entites/department.dart';
import 'package:myco_flutter/features/employees/presentation/bloc/employee_bloc.dart';
import 'package:myco_flutter/features/employees/presentation/bloc/employee_event.dart';
import 'package:myco_flutter/features/employees/presentation/bloc/employee_state.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/employee_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class EmployeesScreen extends StatelessWidget {
  EmployeesScreen({super.key});

  final EmployeeBloc bloc = GetIt.I<EmployeeBloc>();

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return BlocProvider<EmployeeBloc>(
      create: (_) => bloc..add(LoadUserData()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocBuilder<EmployeeBloc, EmployeeState>(
            builder: (context, state) => CustomAppbar(
              title: 'employees',
              isKey: true,
              titleFontSize: 18 * Responsive.getResponsiveText(context),
              titleFontWeight: FontWeight.w700,
              appBarBackgoundColor: AppTheme.getColor(context).surface,
            ),
          ),
        ),
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoading || state is EmployeeInitial) {
              return _buildLoadedContent(context, bloc, null);
            }

            if (state is EmployeeError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is EmployeeLoaded) {
              return _buildLoadedContent(context, bloc, state);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildLoadedContent(
    BuildContext context,
    EmployeeBloc bloc,
    EmployeeLoaded? st,
  ) {
    final bool isShimmer = st == null;
    final filteredEmployees = isShimmer
        ? List.generate(8, (_) => null)
        : st.employees.where((e) {
            final matchesBranch = e.blockId == st.selectedBranch?.blockId;
            final matchesDepartment =
                e.floorId == st.selectedDepartment?.floorId;
            final matchesSearch =
                st.searchQuery.isEmpty ||
                (e.userFullName?.toLowerCase().contains(
                      st.searchQuery.toLowerCase(),
                    ) ??
                    false) ||
                (e.designation?.toLowerCase().contains(
                      st.searchQuery.toLowerCase(),
                    ) ??
                    false);
            return matchesBranch && matchesDepartment && matchesSearch;
          }).toList();

    final double gridPadding = 8 * Responsive.getResponsive(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          CustomSearchField(
            hintText: 'search',
            controller: _searchController,
            onChanged: (q) {
              if (!isShimmer) bloc.add(SearchEmployees(q));
            },
            onSubmitted: (value) {
              debugPrint('value------------>$value');
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _dropdownBranch(context, st)),
              const SizedBox(width: 12),
              Expanded(
                child: _dropdownDepartment(
                  context,
                  st,
                  st?.filteredDepartments ?? [],
                ),
              ),
            ],
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // _searchController.clear();
                context.read<EmployeeBloc>().add(LoadUserData());
              },
              child: isShimmer
                  ? GridView.builder(
                      padding: EdgeInsets.only(
                        top: gridPadding,
                        left: gridPadding,
                        right: gridPadding,
                        bottom: 20 * Responsive.getResponsive(context),
                      ),
                      itemCount: filteredEmployees.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      itemBuilder: (_, __) => const EmployeeSelectionCard(
                        name: '',
                        department: '',
                        image: SizedBox(),
                        isSelected: false,
                      ),
                    )
                  : filteredEmployees.isEmpty
                  ? const Center(child: Text('No employees found'))
                  : GridView.builder(
                      padding: EdgeInsets.only(
                        top: gridPadding,
                        left: gridPadding,
                        right: gridPadding,
                        bottom: 20 * Responsive.getResponsive(context),
                      ),
                      itemCount: filteredEmployees.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      itemBuilder: (_, index) {
                        final emp = filteredEmployees[index]!;
                        return EmployeeSelectionCard(
                          name: emp.userFullName ?? '',
                          department: emp.designation ?? '',
                          image: CachedImage(
                            key: ValueKey(emp.userId),
                            errorWidget: Center(
                              child: CustomText(
                                Util.getInitials(
                                  emp.userFullName?.trim().isNotEmpty == true
                                      ? emp.userFullName!
                                      : 'NA',
                                ),
                                fontSize:
                                    20 * Responsive.getResponsiveText(context),
                                fontWeight: FontWeight.w700,
                                color: AppTheme.getColor(context).primary,
                              ),
                            ),
                            imageProvider: NetworkImage(
                              emp.userProfilePic ?? '',
                            ),
                          ),
                          isSelected: st.selectedEmployeeIds.contains(
                            emp.userId,
                          ),
                          onSelected: (_) {
                            bloc.add(ToggleEmployeeSelection(emp.userId ?? ''));
                            debugPrint('🧾 Selected Employee Details:');
                            debugPrint('ID: ${emp.userId}');
                            debugPrint('Name: ${emp.userFullName}');
                            debugPrint('Designation: ${emp.designation}');
                            debugPrint('Floor ID: ${emp.floorId}');
                            debugPrint('Block ID: ${emp.blockId}');
                            debugPrint('Phone: ${emp.userMobile}');
                            debugPrint('Profile Pic: ${emp.userProfilePic}');
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdownBranch(BuildContext ctx, EmployeeLoaded? st) =>
      GestureDetector(
        onTap: () async {
          if (st == null) return;
          final id = await showCustomSimpleBottomSheet(
            context: ctx,
            heading: 'branch',
            icon: AppAssets.downArrowBottomSheet,
            dataList: st.branches
                .map((b) => {'id': b.blockId ?? '', 'name': b.blockName ?? ''})
                .toList(),
            selectedId: st.selectedBranch?.blockId,
          );

          if (id == null || id == st.selectedBranch?.blockId) return;
          final branch = st.branches.firstWhere((b) => b.blockId == id);
          ctx.read<EmployeeBloc>().add(ChangeBranch(branch));
        },
        child: _buildDropdownBox(
          ctx,
          st?.selectedBranch?.blockName ?? 'branch',
        ),
      );

  Widget _dropdownDepartment(
    BuildContext ctx,
    EmployeeLoaded? st,
    List<Department> depts,
  ) => GestureDetector(
    onTap: () async {
      if (st == null) return;
      final id = await showCustomSimpleBottomSheet(
        context: ctx,
        heading: 'departement',
        icon: AppAssets.downArrowBottomSheet,
        dataList: depts
            .map((d) => {'id': d.floorId ?? '', 'name': d.departmentName ?? ''})
            .toList(),
        selectedId: st.selectedDepartment?.floorId,
      );

      if (id == null || id == st.selectedDepartment?.floorId) return;
      final dept = depts.firstWhere((d) => d.floorId == id);
      ctx.read<EmployeeBloc>().add(ChangeDepartment(dept));
    },
    child: _buildDropdownBox(
      ctx,
      st?.selectedDepartment?.departmentName ?? 'departement',
    ),
  );

  Widget _buildDropdownBox(BuildContext context, String text) {
    final boxHeight = Responsive.isTablet
        ? 48.0
        : 44 * Responsive.getResponsive(context);
    final horizontalPadding = Responsive.isTablet ? 16.0 : 10.0;

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
            Icons.keyboard_arrow_down_rounded,
            size: Responsive.isTablet
                ? 0.060 * Responsive.getHeight(context)
                : 0.020 * Responsive.getHeight(context),
            color: AppTheme.getColor(context).primary,
          ),
        ],
      ),
    );
  }
}

// body: Column(
//   children: [
///Media picker container
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

/// stepper
// const SizedBox(height: 10),
// const Text('Punch in-out Demo'),
// Expanded(
//   child: SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: CustomVerticalStepper(
//         steps: [
//           StepData(
//             title: 'PUNCH IN',
//             // title: '',
//             subTitle: '10:25:06 AM',
//             subTitleFontSize: 20,
//             status: StepStatus.inActive,
//             // isStepIconShow: false,
//             customStatusIcon: SvgPicture.asset(
//               AppAssets.assetGalleryExport,
//             ),
//             // customStatusIcon: const Icon(
//             //   Icons.ac_unit,
//             //   color: Colors.white,
//             // ),
//             details: [
//               StepDetail(title: 'title', description: 'description'),
//               StepDetail(
//                 title: 'Remark',
//                 description: 'description',
//               ), StepDetail(
//                 title: 'Remark Remark',
//                 description: 'description',
//               ),
//             ],
//             subSteps: [
//               SubStepData(
//                 subStepTitle: 'Lunch Break',
//                 subStepSubTitle: '01:32:56 PM - 02:01:46 PM',
//                 subStepTrailingTitle: '28 min 50 sec',
//                 subStepStatus: StepStatus.pending,
//                 subStepCustomStatusIcon: Icon(Icons.lunch_dining),
//                 subStepSubTitleFontSize: 20,
//                 isSubStepIconShow: false,
//               ),
//               SubStepData(
//                 subStepTitle: 'Tea Break',
//                 subStepSubTitle: '06:05:02 PM - 06:07:51 PM',
//                 subStepTrailingTitle: '2 min 49 sec',
//                 subStepStatus: StepStatus.pending,
//                 // isSubStepIconShow: false,
//               ),
//             ],
//           ),
//           StepData(
//             title: 'PUNCH OUT',
//             subTitle: '06:08:39 PM',
//             trillingTitle: '7 hour 43 min 33 sec',
//             status: StepStatus.pending,
//             // isStepIconShow: false,
//           ),
//           StepData(
//             title: 'PUNCH IN & OUT',
//             subTitle: '06:08:39 PM',
//             trillingTitle: '1 min 18 sec',
//             status: StepStatus.approved,
//             // isStepIconShow: true,
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
// ],
// ),

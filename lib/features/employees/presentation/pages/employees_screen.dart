import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/asset/widgets/cached_image_holder.dart';
import 'package:myco_flutter/features/employees/domain/entites/department.dart';
import 'package:myco_flutter/widgets/custom_loader.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';

import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import '../bloc/employee_state.dart';
import '../widgets/employee_card.dart';

class EmployeesScreen extends StatelessWidget {
  EmployeesScreen({Key? key}) : super(key: key);

  final EmployeeBloc bloc = GetIt.I<EmployeeBloc>();

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
            builder: (context, state) {
              final selectedBranchName = state is EmployeeLoaded
                  ? state.selectedBranch?.blockName ?? 'branch'
                  : 'branch';

              return CustomAppbar(
                title: CustomText(
                  selectedBranchName,
                  isKey: true,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w700,
                ),
                appBarBackgoundColor: AppTheme.getColor(context).surface,
                appbartxtcolor: AppTheme.getColor(context).onSurface,
              );
            },
          ),
        ),
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoading || state is EmployeeInitial) {
              return const Center(child: CustomLoader());
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
    EmployeeLoaded st,
  ) {
    final filteredEmployees = st.employees.where((e) {
      final matchesBranch = e.blockId == st.selectedBranch?.blockId;
      final matchesDepartment = e.floorId == st.selectedDepartment?.floorId;
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
    double gridPadding = 8 * Responsive.getResponsive(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          MyCoTextfield(
            prefix: SvgPicture.asset(
              AppAssets.searchNormal,
              fit: BoxFit.scaleDown,
            ),
            hintText: 'search',
            textInputType: TextInputType.text,
            textAlignment: TextAlign.left,
            boarderRadius: 10,
            hintTextStyle: TextStyle(
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            contentPadding: EdgeInsets.all(
              10 * Responsive.getResponsive(context),
            ),
            onChanged: (q) => bloc.add(SearchEmployees(q)),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _dropdownBranch(context, st)),
              const SizedBox(width: 12),
              Expanded(
                child: _dropdownDepartment(context, st, st.filteredDepartments),
              ),
            ],
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                bloc.add(LoadUserData());
              },
              child: filteredEmployees.isEmpty
                  ? const Center(child: Text('No employees found'))
                  : GridView.builder(
                      padding: EdgeInsets.only(
                        top: gridPadding,
                        left: gridPadding,
                        right: gridPadding,
                        bottom: 20,
                      ),
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
                      itemCount: filteredEmployees.length,
                      itemBuilder: (_, index) {
                        final emp = filteredEmployees[index];
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
                                    16 * Responsive.getResponsiveText(context),
                                fontWeight: FontWeight.w700,
                                color: AppTheme.getColor(context).primary,
                              ),
                            ),
                            imageProvider: NetworkImage(emp.userProfilePic ?? ''),
                          ),
                          isSelected: st.selectedEmployeeIds.contains(emp.userId),
                          onSelected: (_) {
                            bloc.add(ToggleEmployeeSelection(emp.userId ?? ''));
                            // Print all employee details
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

  Widget _dropdownBranch(BuildContext ctx, EmployeeLoaded st) =>
      GestureDetector(
        onTap: () async {
          final id = await showCustomSimpleBottomSheet(
            context: ctx,
            heading: 'select_branch',
            icon: const AssetImage(AppAssets.downArrow),
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
          st.selectedBranch?.blockName ?? 'select_branch',
        ),
      );

  Widget _dropdownDepartment(
    BuildContext ctx,
    EmployeeLoaded st,
    List<Department> depts,
  ) => GestureDetector(
    onTap: () async {
      final id = await showCustomSimpleBottomSheet(
        context: ctx,
        heading: 'select_department',
        icon: const AssetImage(AppAssets.downArrow),
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
      st.selectedDepartment?.departmentName ?? 'select_department',
    ),
  );

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
            Icons.keyboard_arrow_down_rounded,
            size: isWide ? 16 : 14 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).primary,
          ),
        ],
      ),
    );
  }
}

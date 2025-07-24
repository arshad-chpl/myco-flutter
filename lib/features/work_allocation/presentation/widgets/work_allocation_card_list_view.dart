import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/api_result_state.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/inquiry/inquiry_state.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_bloc.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_event.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_state.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/assign_to_and_detail_row_widget.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/common_row.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/work_allocation_person_detail_widget.dart';
import 'package:myco_flutter/widgets/custom_horizontal_stepper.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class WorkAllocationCardListView extends StatefulWidget {
  const WorkAllocationCardListView({super.key});

  @override
  State<WorkAllocationCardListView> createState() =>
      _WorkAllocationCardListViewState();
}

class _WorkAllocationCardListViewState
    extends State<WorkAllocationCardListView> {
  String? userId;
  String? companyId;
  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    final preferenceManager = GetIt.I<PreferenceManager>();
    companyId = await preferenceManager.getCompanyId();
    userId = await preferenceManager.getUserId();
    final languageId = await preferenceManager.getLanguageId();
    makeApiCall();
    // final state = context.read<WorkAllocationBloc>().add(
    //   FetchWorkAllocationListEvent(
    //     WorkAllocationRequest(
    //       tag: 'getWorkAllocation',
    //       companyId: companyId ?? '',
    //       userId: userId ?? '',
    //       workAllocationAddAccess: '',
    //       filterMonth: false,
    //       filterYear: '2025',
    //     ),
    //   ),
    // );
  }

  void makeApiCall() {
    if (userId != null && companyId != null) {
      final request = WorkAllocationRequest(
        tag: 'getWorkAllocation',
        companyId: companyId,
        userId: userId,
        workAllocationAddAccess: '',
        filterMonth: false,
        filterYear: '2025',
      );

      context.read<WorkAllocationBloc>().add(
        FetchWorkAllocationListEvent(request),
      );
    } else {
      print('Error: User ID or Company ID is null. Cannot make API call.');
    }
  }

  /*   List<Map<String, dynamic>> workAllocationData = [
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': AppAssets.personProfileImage,
      'empName': 'Ajaj Ajmeri',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
      'status': 'Pending', // or 'Approved', 'Completed', 'Authorized', 'Denied'
    },
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': AppAssets.personProfileImage,
      'empName': 'vinay parihar',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
      'status':
          'Approved', // or 'Approved', 'Completed', 'Authorized', 'Denied'
    },
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': AppAssets.personProfileImage,
      'empName': 'vinay parihar',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
      'status': 'Completed',
      // or 'Approved', 'Completed', 'Authorized', 'Denied'
    },
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': AppAssets.personProfileImage,
      'empName': 'vinay parihar',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
      'status': 'Authorized',
      // or 'Approved', 'Completed', 'Authorized', 'Denied'
    },
    {
      'title': '22 May 2025, 10:00 AM',
      'imagePath': AppAssets.personProfileImage,
      'empName': 'vinay parihar',
      'designation': 'H.O.D',
      'fieldWithCity': 'Technical - Ahmedabad',
      'workCategory': 'AI Tools',
      'project': 'FJC',
      'startDate': '21st May 2025',
      'endDate': '22nd May 2025',
      'status': 'Denied', // or 'Approved', 'Completed', 'Authorized', 'Denied'
    },
  ]; */

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<WorkAllocationBloc, WorkAllocationState>(
    builder: (context, state) {
      if (state is WorkAllocationInitial || state is WorkAllocationLoading) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 6,
            itemBuilder: (_, __) => Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 120,
              decoration: BoxDecoration(
                color: AppTheme.getColor(context).onPrimary,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        );
      } else if (state is WorkAllocationList) {
        return ListView.builder(
          padding: EdgeInsets.only(
            top: 13 * Responsive.getResponsive(context),
            left: 13 * Responsive.getResponsive(context),
            bottom: 72 * Responsive.getResponsive(context),
            right: 13 * Responsive.getResponsive(context),
          ),
          itemCount: state.workAllocationList.workAllocation?.length ?? 0,
          itemBuilder: (context, index) {
            final workAllocation =
                state.workAllocationList.workAllocation![index];

            return Padding(
              padding: EdgeInsets.only(
                bottom: 17 * Responsive.getResponsive(context),
              ),
              child: CommonCard(
                title: workAllocation.createdDate ?? '',
                headerColor: AppTheme.getColor(context).primary,
                headerPrefixIcon: AppAssets.calendarIcon,
                showHeaderPrefixIcon: true,
                bottomWidget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const AssignToAndDetailRowWidget(),
                      WorkAllocationPersonDetailWidget(
                        imagePath: workAllocation.userProfilePic ?? '',
                        empName: workAllocation.userFullName ?? '',
                        designation: workAllocation.userDesignation ?? '',
                        fieldWithCity: workAllocation.location ?? '',
                      ),
                      Divider(color: AppTheme.getColor(context).secondary),
                      CommonRow(
                        title: 'Work Category',
                        value: workAllocation.workCategoryName ?? '',
                        textColor: AppColors.textGray,
                      ),
                      SizedBox(height: 0.005 * Responsive.getHeight(context)),
                      CommonRow(
                        title: 'Project',
                        value: workAllocation.projectName ?? '',
                        textColor: AppColors.textGray,
                      ),
                      SizedBox(height: 0.005 * Responsive.getHeight(context)),
                      CommonRow(
                        title: 'Work Start Date',
                        value: workAllocation.startDate ?? '',
                        textColor: AppColors.textGray,
                      ),
                      SizedBox(height: 0.005 * Responsive.getHeight(context)),
                      CommonRow(
                        title: 'Target Date of Completion',
                        value: workAllocation.endDate ?? '',
                        textColor: AppColors.textGray,
                      ),
                      SizedBox(height: 0.005 * Responsive.getHeight(context)),
                      Divider(color: AppTheme.getColor(context).secondary),

                      SizedBox(height: 0.005 * Responsive.getHeight(context)),
                      StatusTimeline(
                        steps: getTimelineSteps(
                          workAllocation.engineerStatus ?? '',
                        ),
                        // linewidth: 72,
                        // circleSize: 14,
                        textSlotWidthMultiplier: 3.5,
                      ),
                      SizedBox(height: 0.005 * Responsive.getHeight(context)),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      } else if (state is WorkAllocationError) {
        return Center(child: Text(state.error));
      }
      return const SizedBox.shrink();
    },
  );

  List<TimelineStep> getTimelineSteps(String currentStatus) {
    final steps = <TimelineStep>[];

    if (currentStatus == 'Denied') {
      // Only show "Pending" and "Denied"
      steps.add(
        TimelineStep(
          label: 'Pending',
          color: AppTheme.getColor(context).error,
          isActive: true,
        ),
      );
      steps.add(
        TimelineStep(
          label: 'Denied',
          color: AppTheme.getColor(context).error,
          imagePath: AppAssets.cancelCross,
          isActive: true,
        ),
      );
    } else if (currentStatus == 'Pending') {
      steps.add(
        const TimelineStep(
          label: 'Pending',
          color: AppColors.spanishYellow,
          isActive: true,
        ),
      );
      steps.add(
        const TimelineStep(
          label: 'Approved',
          color: AppColors.textGray,
          imagePath: AppAssets.checkMark,
        ),
      );
      steps.add(
        const TimelineStep(
          label: 'Completed',
          color: AppColors.textGray,
          imagePath: AppAssets.checkMark,
        ),
      );
      steps.add(
        const TimelineStep(
          label: 'Authorized',
          color: AppColors.textGray,
          imagePath: AppAssets.checkMark,
        ),
      );
    } else if (currentStatus == 'Approved') {
      steps.add(
        TimelineStep(
          label: 'Pending',
          color: AppTheme.getColor(context).secondary,
          isActive: true,
        ),
      );
      steps.add(
        TimelineStep(
          label: 'Approved',
          color: AppTheme.getColor(context).secondary,
          imagePath: AppAssets.checkMark,
          isActive: true,
        ),
      );
      steps.add(
        const TimelineStep(
          label: 'Completed',
          color: AppColors.textGray,
          imagePath: AppAssets.checkMark,
        ),
      );
      steps.add(
        const TimelineStep(
          label: 'Authorized',
          color: AppColors.textGray,
          imagePath: AppAssets.checkMark,
        ),
      );
    } else if (currentStatus == 'Completed') {
      steps.add(
        TimelineStep(
          label: 'Pending',
          color: AppTheme.getColor(context).secondary,
          isActive: true,
        ),
      );
      steps.add(
        TimelineStep(
          label: 'Approved',
          color: AppTheme.getColor(context).secondary,
          imagePath: AppAssets.checkMark,
          isActive: true,
        ),
      );
      steps.add(
        TimelineStep(
          label: 'Completed',
          color: AppTheme.getColor(context).secondary,
          imagePath: AppAssets.checkMark,
          isActive: true,
        ),
      );
      steps.add(
        const TimelineStep(
          label: 'Authorized',
          color: AppColors.textGray,
          imagePath: AppAssets.checkMark,
        ),
      );
    } else if (currentStatus == 'Authorized') {
      steps.add(
        TimelineStep(
          label: 'Pending',
          color: AppTheme.getColor(context).secondary,
          isActive: true,
        ),
      );
      steps.add(
        TimelineStep(
          label: 'Approved',
          color: AppTheme.getColor(context).secondary,
          imagePath: AppAssets.checkMark,
          isActive: true,
        ),
      );
      steps.add(
        TimelineStep(
          label: 'Completed',
          color: AppTheme.getColor(context).secondary,
          imagePath: AppAssets.checkMark,
          isActive: true,
        ),
      );
      steps.add(
        TimelineStep(
          label: 'Authorized',
          color: AppTheme.getColor(context).secondary,
          imagePath: AppAssets.checkMark,
          isActive: true,
        ),
      );
    }
    return steps;
  }
}

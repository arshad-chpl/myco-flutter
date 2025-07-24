import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation/work_allocation_bloc.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation/work_allocation_event.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation/work_allocation_state.dart';
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
    _fetchWorkAllocationData();
  }

  Future<void> _fetchWorkAllocationData() async {
    final preferenceManager = GetIt.I<PreferenceManager>();
    companyId = await preferenceManager.getCompanyId();
    userId = await preferenceManager.getUserId();
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
          itemCount: state.workAllocationList.workAllocation?.length ?? 0,
          itemBuilder: (context, index) {
            final workAllocation =
                state.workAllocationList.workAllocation![index];

            return Padding(
              padding: EdgeInsets.symmetric(
                vertical:
                    VariableBag.commonCardHorizontalPadding *
                    Responsive.getResponsive(context),
              ),
              child: CommonCard(
                title: workAllocation.createdDate ?? '',
                headerColor: AppTheme.getColor(context).primary,
                headerPrefixIcon: AppAssets.calendarIcon,
                showHeaderPrefixIcon: true,
                bottomWidget: Padding(
                  padding: EdgeInsets.all(
                    8 * Responsive.getResponsive(context),
                  ),
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
                        title: LanguageManager().get("work_category"),
                        value: workAllocation.workCategoryName ?? '',
                        textColor: AppColors.textGray,
                      ),
                      CommonRow(
                        title: LanguageManager().get("project"),
                        value: workAllocation.projectName ?? '',
                        textColor: AppColors.textGray,
                      ),
                      CommonRow(
                        title: LanguageManager().get("work_start_date"),
                        value: workAllocation.startDate ?? '',
                        textColor: AppColors.textGray,
                      ),
                      CommonRow(
                        title: LanguageManager().get(
                          "target_date_of_completion",
                        ),
                        value: workAllocation.endDate ?? '',
                        textColor: AppColors.textGray,
                      ),
                      Divider(color: AppTheme.getColor(context).secondary),
                      StatusTimeline(
                        steps: getTimelineStepsFromModel(
                          context: context,
                          engineerStatus: workAllocation.engineerStatus ?? '',
                          completionDateByEng:
                              workAllocation.completionDateByEngg,
                          authorizedDateByHod:
                              workAllocation.authorizedDateByHod,
                        ),
                        textSlotWidthMultiplier: 3.5,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      } else if (state is WorkAllocationError) {
        return Center(child: CustomText(state.error));
      }
      return const SizedBox.shrink();
    },
  );

  List<TimelineStep> getTimelineStepsFromModel({
    required BuildContext context,
    required String engineerStatus,
    required String? completionDateByEng,
    required String? authorizedDateByHod,
  }) {
    final steps = <TimelineStep>[];

    // Normalize values
    final status = engineerStatus.trim().toLowerCase();
    final isCompleted = (completionDateByEng?.trim().isNotEmpty ?? false);
    final isAuthorized = (authorizedDateByHod?.trim().isNotEmpty ?? false);

    // Handle Denied case
    if (status == 'denied') {
      return [
        TimelineStep(
          label: 'Pending',
          color: AppTheme.getColor(context).error,
          isActive: true,
        ),
        TimelineStep(
          label: 'Denied',
          color: AppTheme.getColor(context).error,
          imagePath: AppAssets.cancelCross,
          isActive: true,
        ),
      ];
    }

    // Determine active steps
    bool pendingActive = false;
    bool approvedActive = false;
    bool completedActive = false;
    bool authorizedActive = false;

    if (status == '0') {
      // Only pending
      pendingActive = true;
    } else if (status == '1' && !isCompleted) {
      // Pending and approved
      pendingActive = true;
      approvedActive = true;
    } else if (status == '2') {
      // Pending and approved
      pendingActive = true;
      approvedActive = true;
    }

    if (isCompleted && !isAuthorized) {
      // Completed added
      pendingActive = true;
      approvedActive = true;
      completedActive = true;
    }

    if (isCompleted && isAuthorized) {
      // All steps complete
      pendingActive = true;
      approvedActive = true;
      completedActive = true;
      authorizedActive = true;
    }

    String? getIcon(bool active) => active ? AppAssets.checkMark : null;

    // Build step list
    steps.add(
      TimelineStep(
        label: 'Pending',
        color: AppColors.spanishYellow,
        isActive: pendingActive,
      ),
    );
    steps.add(
      TimelineStep(
        label: 'Approved',
        color: AppColors.textGray,
        isActive: approvedActive,
        imagePath: getIcon(approvedActive),
      ),
    );
    steps.add(
      TimelineStep(
        label: 'Completed',
        color: AppColors.secondary,
        isActive: completedActive,
        imagePath: getIcon(completedActive),
      ),
    );
    steps.add(
      TimelineStep(
        label: 'Authorized',
        color: AppColors.secondary,
        isActive: authorizedActive,
        imagePath: getIcon(authorizedActive),
      ),
    );

    return steps;
  }
}

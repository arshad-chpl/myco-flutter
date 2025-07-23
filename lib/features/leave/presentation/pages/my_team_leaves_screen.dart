import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';

class MyTeamLeavesScreen extends StatefulWidget {
  const MyTeamLeavesScreen({super.key});

  @override
  State<MyTeamLeavesScreen> createState() => _MyTeamLeavesScreenState();
}

class _MyTeamLeavesScreenState extends State<MyTeamLeavesScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger the API call when the screen loads
    context.read<LeaveBloc>().add(const FetchMyTeamLeaveList());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
      title: const Text('My Team Leaves'),
      centerTitle: true,
    ),
    body: BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        if (state is LeaveLoading) {
          return _buildShimmerLoading();
        } else if (state is TeamLeaveListFetched) {
          final response = state.teamLeaveList;
          return _buildBody(response);
        } else if (state is LeaveError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('No data available'));
      },
    ),
  );

  Widget _buildBody(MyTeamResponseModel response) {
    final thisWeekLeaves = response.leaveList ?? [];
    final nextWeekLeaves = response.leaveListNextWeek ?? [];

    final hasThisWeekLeaves = thisWeekLeaves.isNotEmpty;
    final hasNextWeekLeaves = nextWeekLeaves.isNotEmpty;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLeaveSection(
            title: 'On Leave This Week',
            leaves: thisWeekLeaves,
            hasLeaves: hasThisWeekLeaves,
          ),
          const SizedBox(height: 16),
          _buildLeaveSection(
            title: 'On Leave Next Week',
            leaves: nextWeekLeaves,
            hasLeaves: hasNextWeekLeaves,
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveSection({
    required String title,
    required List<LeaveModel> leaves,
    required bool hasLeaves,
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 8),
      if (hasLeaves)
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: leaves.length,
          itemBuilder: (context, index) => _buildLeaveCard(leaves[index]),
        )
      else
        Container(
          height: 150,
          alignment: Alignment.center,
          child: const Text('No Leave Available!'),
        ),
    ],
  );

  Widget _buildLeaveCard(LeaveModel leave) => Card(
    margin: const EdgeInsets.only(bottom: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 2,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text(
                leave.leaveDateView ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserAvatar(leave),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              leave.userFullName ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(${leave.userDesignation ?? ''})',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildLeaveTypeInfo(leave),
                      ],
                    ),
                  ),
                ],
              ),
              if (leave.leaveReason != null && leave.leaveReason!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Leave Reason:',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(leave.leaveReason!),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildUserAvatar(LeaveModel leave) {
    if (leave.userProfilePic != null && leave.userProfilePic!.isNotEmpty) {
      return CircleAvatar(
        radius: 20,
        backgroundImage: CachedNetworkImageProvider(leave.userProfilePic!),
      );
    } else {
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Center(
          child: Text(
            leave.shortName ?? 'NA',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  Widget _buildLeaveTypeInfo(LeaveModel leave) => Wrap(
    spacing: 8,
    children: [
      if (leave.leaveTypeName != null && leave.leaveTypeName!.isNotEmpty)
        Text(
          leave.leaveTypeName!,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      Container(width: 1, height: 12, color: Colors.grey),
      Text(
        '${leave.leaveDayType ?? ''} - ${leave.leaveType ?? ''}',
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );

  Widget _buildShimmerLoading() => ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: 3,
    itemBuilder: (context, index) => Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 180,
        child: Column(
          children: [
            Container(height: 40, color: Colors.grey[200]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 16,
                                width: 150,
                                color: Colors.grey[200],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 14,
                                width: 200,
                                color: Colors.grey[200],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 14,
                      width: double.infinity,
                      color: Colors.grey[200],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 14,
                      width: double.infinity,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// comp_off_leaves_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/leave/data/model/comp_off_leave_response_model.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class CompOffLeavesScreen extends StatelessWidget {
  final CompOffLeaveResponseEntity leaveResponse;

  const CompOffLeavesScreen({super.key, required this.leaveResponse});

  @override
  Widget build(BuildContext context) {
    final hasData = leaveResponse.leaves?.isNotEmpty ?? false;

    return FractionallySizedBox(
      heightFactor: 0.77,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonCard(
                borderRadius: 10,
                title: 'Comp Off Leaves',

                bottomWidget: Container(),
              ),
              const SizedBox(height: 16),
              hasData ? _buildLeaveList(context) : _buildNoDataView(context),
              const SizedBox(height: 16),
              MyCoButton(
                onTap: () {
                  context.pop();
                },
                title: 'close',
                boarderRadius: 50,
                isShadowBottomLeft: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoDataView(BuildContext context) => const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline, size: 60, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No leave data available',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF333333),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildLeaveList(BuildContext context) {
    final items = leaveResponse.leaves!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppTheme.getColor(context).primary),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (_, __) =>
            Divider(color: AppTheme.getColor(context).primary),
        itemBuilder: (context, index) => _LeaveItemWidget(leave: items[index]),
      ),
    );
  }
}

class _LeaveItemWidget extends StatelessWidget {
  final LeavesItemEntity leave;

  const _LeaveItemWidget({super.key, required this.leave});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      _buildLeaveRow(
        context: context,
        icon: AppAssets.note_favorite,
        label: 'Leave Against',
        value: _formatDate(leave.attendanceDate),
      ),
      const SizedBox(height: 10),
      _buildLeaveRow(
        context: context,
        icon: AppAssets.note_favorite,
        label: 'Leave Expire On',
        value: _formatDate(leave.leaveExpireDate),
      ),
      const SizedBox(height: 10),
      _buildLeaveRow(
        context: context,
        icon: AppAssets.note_favorite,
        label: 'Is Leave Used',
        value: leave.isLeaveUsed ?? 'N/A',
      ),
      const SizedBox(height: 10),
      _buildLeaveRow(
        context: context,
        icon: AppAssets.note_favorite,
        label: 'leave_type',
        value: leave.extraDayLeaveDayType ?? 'N/A',
      ),
    ],
  );

  Widget _buildLeaveRow({
    required BuildContext context,
    required String icon,
    required String label,
    required String value,
    bool isKey = true,
  }) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(icon, height: 0.02 * Responsive.getHeight(context)),
      const SizedBox(width: 10),
      Expanded(
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
            children: [
              TextSpan(
                text: '${isKey ? LanguageManager().get(label) : label} : ',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    ],
  );

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return 'N/A';
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('EEEE, dd MMMM yyyy').format(parsedDate);
    } catch (_) {
      return date;
    }
  }
}

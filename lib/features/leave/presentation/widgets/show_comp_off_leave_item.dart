import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/features/leave/model/comp_off_leave_response_model.dart';

class CompOffLeavesScreen extends StatelessWidget {
  final CompOffLeaveResponseEntity leaveResponse;

  const CompOffLeavesScreen({super.key, required this.leaveResponse});

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
    initialChildSize: 0.9,
    minChildSize: 0.5,
    maxChildSize: 0.95,
    builder: (_, controller) => Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: (leaveResponse.leaves?.isEmpty ?? true)
                ? _buildNoDataView(context)
                : _buildLeaveList(context, controller),
          ),
        ],
      ),
    ),
  );
  Widget _buildHeader(BuildContext context) => Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Comp Off Leaves',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );

  Widget _buildNoDataView(BuildContext context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://example.com/no_data_icon.png', // Replace with actual icon URL
            width: 60,
            height: 60,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.info_outline,
              size: 60,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'No leave data available',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF333333),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );

  Widget _buildLeaveList(BuildContext context, ScrollController controller) => ListView.separated(
      controller: controller,
      padding: const EdgeInsets.all(16),
      itemCount: leaveResponse.leaves!.length,
      separatorBuilder: (context, index) => index == leaveResponse.leaves!.length - 1
          ? const SizedBox.shrink()
          : const Divider(
        color: Color(0xFFE0E0E0),
        height: 16,
        thickness: 1,
      ),
      itemBuilder: (context, index) => _LeaveItemWidget(
        leave: leaveResponse.leaves![index],
      ),
    );
}

class _LeaveItemWidget extends StatelessWidget {
  final LeavesItemEntity leave;

  const _LeaveItemWidget({super.key, required this.leave});

  @override
  Widget build(BuildContext context) => Column(
      children: [
        _buildLeaveRow(
          icon: Icons.calendar_today,
          label: 'Leave Against',
          value: _formatDate(leave.attendanceDate),
        ),
        const SizedBox(height: 8),
        _buildLeaveRow(
          icon: Icons.calendar_today,
          label: 'Leave Expire On',
          value: _formatDate(leave.leaveExpireDate),
        ),
        const SizedBox(height: 8),
        _buildLeaveRow(
          icon: Icons.check_circle,
          label: 'Is Leave Used',
          value: leave.isLeaveUsed ?? 'N/A',
        ),
        const SizedBox(height: 8),
        _buildLeaveRow(
          icon: Icons.category,
          label: 'Leave Type',
          value: leave.extraDayLeaveDayType ?? 'N/A',
        ),
      ],
    );

  Widget _buildLeaveRow({
    required IconData icon,
    required String label,
    required String value,
  }) => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xFF333333),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const Text(
          ' : ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF333333),
            ),
          ),
        ),
      ],
    );

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return 'N/A';
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd MMM yyyy').format(parsedDate);
    } catch (e) {
      return date;
    }
  }
}

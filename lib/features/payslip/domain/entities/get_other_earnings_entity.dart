class GetOtherEarningsEntity {
  final List<OtherEarningEntity>? otherEarnings;
  final String? totalEarnings;
  final String? message;
  final String? status;

  GetOtherEarningsEntity({
    required this.otherEarnings,
    required this.totalEarnings,
    required this.message,
    required this.status,
  });
}

class OtherEarningEntity {
  final String? leavePayoutId;
  final String? leaveTypeId;
  final String? leaveTypeName;
  final String? noOfPayoutLeaves;
  final String? leavePayoutAmount;
  final String? leavePayoutRemark;
  final String? leavePayoutDate;

  OtherEarningEntity({
    required this.leavePayoutId,
    required this.leaveTypeId,
    required this.leaveTypeName,
    required this.noOfPayoutLeaves,
    required this.leavePayoutAmount,
    required this.leavePayoutRemark,
    required this.leavePayoutDate,
  });
}

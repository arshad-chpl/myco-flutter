// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_other_earnings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOtherEarningsModel _$GetOtherEarningsModelFromJson(
  Map<String, dynamic> json,
) => GetOtherEarningsModel(
  otherEarnings:
      (json['other_earnings'] as List<dynamic>?)
          ?.map((e) => OtherEarning.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalEarnings: json['total_earnings'] as String?,
  message: json['message'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$GetOtherEarningsModelToJson(
  GetOtherEarningsModel instance,
) => <String, dynamic>{
  'other_earnings': instance.otherEarnings,
  'total_earnings': instance.totalEarnings,
  'message': instance.message,
  'status': instance.status,
};

OtherEarning _$OtherEarningFromJson(Map<String, dynamic> json) => OtherEarning(
  leavePayoutId: json['leave_payout_id'] as String?,
  leaveTypeId: json['leave_type_id'] as String?,
  leaveTypeName: json['leave_type_name'] as String?,
  noOfPayoutLeaves: json['no_of_payout_leaves'] as String?,
  leavePayoutAmount: json['leave_payout_amount'] as String?,
  leavePayoutRemark: json['leave_payout_remark'] as String?,
  leavePayoutDate: json['leave_payout_date'] as String?,
);

Map<String, dynamic> _$OtherEarningToJson(OtherEarning instance) =>
    <String, dynamic>{
      'leave_payout_id': instance.leavePayoutId,
      'leave_type_id': instance.leaveTypeId,
      'leave_type_name': instance.leaveTypeName,
      'no_of_payout_leaves': instance.noOfPayoutLeaves,
      'leave_payout_amount': instance.leavePayoutAmount,
      'leave_payout_remark': instance.leavePayoutRemark,
      'leave_payout_date': instance.leavePayoutDate,
    };

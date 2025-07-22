import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:myco_flutter/features/payslip/domain/entities/get_other_earnings_entity.dart';

part 'get_other_earnings_model.g.dart';

GetOtherEarningsModel getOtherEarningsModelFromJson(String str) =>
    GetOtherEarningsModel.fromJson(json.decode(str));

String getOtherEarningsModelToJson(GetOtherEarningsModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetOtherEarningsModel {
  @JsonKey(name: 'other_earnings')
  List<OtherEarning>? otherEarnings;
  @JsonKey(name: 'total_earnings')
  String? totalEarnings;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;

  GetOtherEarningsModel({
    this.otherEarnings,
    this.totalEarnings,
    this.message,
    this.status,
  });

  factory GetOtherEarningsModel.fromJson(Map<String, dynamic> json) =>
      _$GetOtherEarningsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOtherEarningsModelToJson(this);

  GetOtherEarningsEntity toEntity() => GetOtherEarningsEntity(
    otherEarnings: otherEarnings?.map((e) => e.toEntity()).toList(),
    totalEarnings: totalEarnings,
    message: message,
    status: status,
  );
}

@JsonSerializable()
class OtherEarning {
  @JsonKey(name: 'leave_payout_id')
  String? leavePayoutId;
  @JsonKey(name: 'leave_type_id')
  String? leaveTypeId;
  @JsonKey(name: 'leave_type_name')
  String? leaveTypeName;
  @JsonKey(name: 'no_of_payout_leaves')
  String? noOfPayoutLeaves;
  @JsonKey(name: 'leave_payout_amount')
  String? leavePayoutAmount;
  @JsonKey(name: 'leave_payout_remark')
  String? leavePayoutRemark;
  @JsonKey(name: 'leave_payout_date')
  String? leavePayoutDate;

  OtherEarning({
    this.leavePayoutId,
    this.leaveTypeId,
    this.leaveTypeName,
    this.noOfPayoutLeaves,
    this.leavePayoutAmount,
    this.leavePayoutRemark,
    this.leavePayoutDate,
  });

  factory OtherEarning.fromJson(Map<String, dynamic> json) =>
      _$OtherEarningFromJson(json);

  Map<String, dynamic> toJson() => _$OtherEarningToJson(this);

  OtherEarningEntity toEntity() => OtherEarningEntity(
    leavePayoutId: leavePayoutId,
    leaveTypeId: leaveTypeId,
    leaveTypeName: leaveTypeName,
    noOfPayoutLeaves: noOfPayoutLeaves,
    leavePayoutAmount: leavePayoutAmount,
    leavePayoutRemark: leavePayoutRemark,
    leavePayoutDate: leavePayoutDate,
  );
}

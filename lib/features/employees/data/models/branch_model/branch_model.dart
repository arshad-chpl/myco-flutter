import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/employees/domain/entites/branch.dart'; // Import the entity
import 'package:equatable/equatable.dart';
import 'dart:convert';

part 'branch_model.g.dart';

BranchModel branchModelFromJson(String str) =>
    BranchModel.fromJson(json.decode(str));

String branchModelToJson(BranchModel data) => json.encode(data.toJson());

@JsonSerializable()
class BranchModel extends Equatable {
  @JsonKey(name: "block_id")
  final String? blockId;

  @JsonKey(name: "block_name")
  final String? blockName;

  @JsonKey(name: "society_id")
  final String? societyId;

  const BranchModel({this.blockId, this.blockName, this.societyId});

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchModelToJson(this);

  Branch toEntity() =>
      Branch(blockId: blockId, blockName: blockName, societyId: societyId);

  @override
  List<Object?> get props => [blockId, blockName, societyId];
}

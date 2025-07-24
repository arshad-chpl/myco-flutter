import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/common_api/domain/entities/Branch_response_entity.dart';

part 'branch_response.g.dart';

BranchResponseModel branchResponseModelFromJson(String str) =>
    BranchResponseModel.fromJson(json.decode(str));

String branchResponseModelToJson(BranchResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class BranchResponseModel {
  @JsonKey(name: "block")
  final List<BlockModel>? block;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "status")
  final String? status;

  BranchResponseModel({
    this.block,
    this.message,
    this.status,
  });

  factory BranchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BranchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchResponseModelToJson(this);

  /// Converts the data model to a domain entity.
  BranchResponseEntity toEntity() => BranchResponseEntity(
    blocks: block?.map((b) => b.toEntity()).toList(),
    message: message,
    status: status,
  );
}

@JsonSerializable()
class BlockModel {
  @JsonKey(name: "block_id")
  final String? blockId;
  @JsonKey(name: "society_id")
  final String? societyId;
  @JsonKey(name: "block_name")
  final String? blockName;
  @JsonKey(name: "block_status")
  final String? blockStatus;

  BlockModel({
    this.blockId,
    this.societyId,
    this.blockName,
    this.blockStatus,
  });

  factory BlockModel.fromJson(Map<String, dynamic> json) =>
      _$BlockModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlockModelToJson(this);

  /// Converts the block model to its entity.
  BranchEntity toEntity() => BranchEntity(
    blockId: blockId,
    societyId: societyId,
    blockName: blockName,
    blockStatus: blockStatus,
  );
}

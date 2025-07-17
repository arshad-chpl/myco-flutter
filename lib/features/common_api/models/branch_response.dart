// To parse this JSON data, do
//
//     final branchResponse = branchResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'branch_response.g.dart';

BranchResponse branchResponseFromJson(String str) => BranchResponse.fromJson(json.decode(str));

String branchResponseToJson(BranchResponse data) => json.encode(data.toJson());

@JsonSerializable()
class BranchResponse {
  @JsonKey(name: "block")
  List<Block>? block;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status")
  String? status;

  BranchResponse({
    this.block,
    this.message,
    this.status,
  });

  factory BranchResponse.fromJson(Map<String, dynamic> json) => _$BranchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BranchResponseToJson(this);
}

@JsonSerializable()
class Block {
  @JsonKey(name: "block_id")
  String? blockId;
  @JsonKey(name: "society_id")
  String? societyId;
  @JsonKey(name: "block_name")
  String? blockName;
  @JsonKey(name: "block_status")
  String? blockStatus;

  Block({
    this.blockId,
    this.societyId,
    this.blockName,
    this.blockStatus,
  });

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);

  Map<String, dynamic> toJson() => _$BlockToJson(this);
}

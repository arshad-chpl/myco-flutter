// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchResponse _$BranchResponseFromJson(Map<String, dynamic> json) =>
    BranchResponse(
      block: (json['block'] as List<dynamic>?)
          ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$BranchResponseToJson(BranchResponse instance) =>
    <String, dynamic>{
      'block': instance.block,
      'message': instance.message,
      'status': instance.status,
    };

Block _$BlockFromJson(Map<String, dynamic> json) => Block(
      blockId: json['block_id'] as String?,
      societyId: json['society_id'] as String?,
      blockName: json['block_name'] as String?,
      blockStatus: json['block_status'] as String?,
    );

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
      'block_id': instance.blockId,
      'society_id': instance.societyId,
      'block_name': instance.blockName,
      'block_status': instance.blockStatus,
    };

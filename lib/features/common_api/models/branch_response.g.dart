// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchResponseModel _$BranchResponseModelFromJson(Map<String, dynamic> json) =>
    BranchResponseModel(
      block: (json['block'] as List<dynamic>?)
          ?.map((e) => BlockModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$BranchResponseModelToJson(
        BranchResponseModel instance) =>
    <String, dynamic>{
      'block': instance.block,
      'message': instance.message,
      'status': instance.status,
    };

BlockModel _$BlockModelFromJson(Map<String, dynamic> json) => BlockModel(
      blockId: json['block_id'] as String?,
      societyId: json['society_id'] as String?,
      blockName: json['block_name'] as String?,
      blockStatus: json['block_status'] as String?,
    );

Map<String, dynamic> _$BlockModelToJson(BlockModel instance) =>
    <String, dynamic>{
      'block_id': instance.blockId,
      'society_id': instance.societyId,
      'block_name': instance.blockName,
      'block_status': instance.blockStatus,
    };

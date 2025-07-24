// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
      blockId: json['block_id'] as String?,
      blockName: json['block_name'] as String?,
      societyId: json['society_id'] as String?,
    );

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'block_id': instance.blockId,
      'block_name': instance.blockName,
      'society_id': instance.societyId,
    };

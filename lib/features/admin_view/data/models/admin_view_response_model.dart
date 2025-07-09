import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';

part 'admin_view_response_model.g.dart';

AdminViewResponseModel adminViewResponseModelFromJson(String str) =>
    AdminViewResponseModel.fromJson(json.decode(str));

@JsonSerializable()
class AdminViewResponseModel {
  @JsonKey(name: 'employee_list')
  final List<EmployeeModel>? employeeList;
  @JsonKey(name: 'branch_list')
  final List<BranchModel>? branchList;
  @JsonKey(name: 'department_list')
  final List<DepartmentModel>? departmentList;
  @JsonKey(name: 'admin_menu_category')
  final List<AdminMenuCategoryModel>? adminMenuCategory;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status')
  final String? status;

  AdminViewResponseModel({
    this.employeeList,
    this.branchList,
    this.departmentList,
    this.adminMenuCategory,
    this.message,
    this.status,
  });

  factory AdminViewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AdminViewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminViewResponseModelToJson(this);

  /// Converts the data model to a domain entity.
  AdminViewResponseEntity toEntity() => AdminViewResponseEntity(
    employeeList: employeeList?.map((model) => model.toEntity()).toList(),
    branchList: branchList?.map((model) => model.toEntity()).toList(),
    departmentList: departmentList?.map((model) => model.toEntity()).toList(),
    adminMenuCategory: adminMenuCategory
        ?.map((model) => model.toEntity())
        .toList(),
    message: message,
    status: status,
  );
}

@JsonSerializable()
class AdminMenuCategoryModel {
  @JsonKey(name: 'access_type_id')
  final String? accessTypeId;
  @JsonKey(name: 'access_type_parent_id')
  final String? accessTypeParentId;
  @JsonKey(name: 'access_type')
  final String? accessType;
  @JsonKey(name: 'access_type_for')
  final String? accessTypeFor;
  @JsonKey(name: 'access_type_image')
  final String? accessTypeImage;
  @JsonKey(name: 'access_type_image_new')
  final String? accessTypeImageNew;
  @JsonKey(name: 'admin_sub_menu')
  final List<AdminSubMenuModel>? adminSubMenu;

  AdminMenuCategoryModel({
    this.accessTypeId,
    this.accessTypeParentId,
    this.accessType,
    this.accessTypeFor,
    this.accessTypeImage,
    this.accessTypeImageNew,
    this.adminSubMenu,
  });

  factory AdminMenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$AdminMenuCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminMenuCategoryModelToJson(this);

  /// Converts the data model to a domain entity.
  AdminMenuCategoryEntity toEntity() => AdminMenuCategoryEntity(
    accessTypeId: accessTypeId,
    accessTypeParentId: accessTypeParentId,
    accessType: accessType,
    accessTypeFor: accessTypeFor,
    accessTypeImage: accessTypeImage,
    accessTypeImageNew: accessTypeImageNew,
    adminSubMenu: adminSubMenu?.map((model) => model.toEntity()).toList(),
  );
}

@JsonSerializable()
class AdminSubMenuModel {
  @JsonKey(name: 'access_type_id')
  final String? accessTypeId;
  @JsonKey(name: 'access_type_parent_id')
  final String? accessTypeParentId;
  @JsonKey(name: 'access_type')
  final String? accessType;
  @JsonKey(name: 'access_type_for')
  final String? accessTypeFor;
  @JsonKey(name: 'access_type_image')
  final String? accessTypeImage;
  @JsonKey(name: 'access_type_image_new')
  final String? accessTypeImageNew;
  @JsonKey(name: 'branchIds')
  final String? branchIds;
  @JsonKey(name: 'departmentIds')
  final String? departmentIds;
  @JsonKey(name: 'employeeIds')
  final String? employeeIds;
  @JsonKey(name: 'isBranchWise')
  final bool? isBranchWise;
  @JsonKey(name: 'isDepartmentWise')
  final bool? isDepartmentWise;
  @JsonKey(name: 'isEmployeeWise')
  final bool? isEmployeeWise;
  @JsonKey(name: 'modification_access')
  final bool? modificationAccess;
  @JsonKey(name: 'pending_count')
  final String? pendingCount;

  AdminSubMenuModel({
    this.accessTypeId,
    this.accessTypeParentId,
    this.accessType,
    this.accessTypeFor,
    this.accessTypeImage,
    this.accessTypeImageNew,
    this.branchIds,
    this.departmentIds,
    this.employeeIds,
    this.isBranchWise,
    this.isDepartmentWise,
    this.isEmployeeWise,
    this.modificationAccess,
    this.pendingCount
  });

  factory AdminSubMenuModel.fromJson(Map<String, dynamic> json) =>
      _$AdminSubMenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminSubMenuModelToJson(this);

  /// Converts the data model to a domain entity.
  AdminSubMenuEntity toEntity() => AdminSubMenuEntity(
    accessTypeId: accessTypeId,
    accessTypeParentId: accessTypeParentId,
    accessType: accessType,
    accessTypeFor: accessTypeFor,
    accessTypeImage: accessTypeImage,
    accessTypeImageNew: accessTypeImageNew,
    branchIds: branchIds,
    departmentIds: departmentIds,
    employeeIds: employeeIds,
    isBranchWise: isBranchWise,
    isDepartmentWise: isDepartmentWise,
    isEmployeeWise: isEmployeeWise,
    modificationAccess: modificationAccess,
    pendingCount: pendingCount,
  );
}

@JsonSerializable()
class BranchModel {
  @JsonKey(name: 'block_id')
  final String? blockId;
  @JsonKey(name: 'block_name')
  final String? blockName;

  BranchModel({this.blockId, this.blockName});

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchModelToJson(this);

  /// Converts the data model to a domain entity.
  BranchEntity toEntity() =>
      BranchEntity(blockId: blockId, blockName: blockName);
}

@JsonSerializable()
class DepartmentModel {
  @JsonKey(name: 'floor_id')
  final String? floorId;
  @JsonKey(name: 'block_id')
  final String? blockId;
  @JsonKey(name: 'floor_name')
  final String? floorName;
  @JsonKey(name: 'block_name')
  final String? blockName;

  DepartmentModel({this.floorId, this.blockId, this.floorName, this.blockName});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentModelToJson(this);

  /// Converts the data model to a domain entity.
  DepartmentEntity toEntity() => DepartmentEntity(
    floorId: floorId,
    blockId: blockId,
    floorName: floorName,
    blockName: blockName,
  );
}

@JsonSerializable()
class EmployeeModel {
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'block_id')
  final String? blockId;
  @JsonKey(name: 'floor_id')
  final String? floorId;
  @JsonKey(name: 'user_full_name')
  final String? userFullName;
  @JsonKey(name: 'user_profile_pic')
  final String? userProfilePic;
  @JsonKey(name: 'block_name')
  final String? blockName;
  @JsonKey(name: 'floor_name')
  final String? floorName;

  EmployeeModel({
    this.userId,
    this.blockId,
    this.floorId,
    this.userFullName,
    this.userProfilePic,
    this.blockName,
    this.floorName,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);

  /// Converts the data model to a domain entity.
  EmployeeEntity toEntity() => EmployeeEntity(
    userId: userId,
    blockId: blockId,
    floorId: floorId,
    userFullName: userFullName,
    userProfilePic: userProfilePic,
    blockName: blockName,
    floorName: floorName,
  );
}

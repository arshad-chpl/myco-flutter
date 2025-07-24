// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_view_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminViewResponseModel _$AdminViewResponseModelFromJson(
  Map<String, dynamic> json,
) => AdminViewResponseModel(
  employeeList:
      (json['employee_list'] as List<dynamic>?)
          ?.map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  branchList:
      (json['branch_list'] as List<dynamic>?)
          ?.map((e) => BranchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  departmentList:
      (json['department_list'] as List<dynamic>?)
          ?.map((e) => DepartmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  adminMenuCategory:
      (json['admin_menu_category'] as List<dynamic>?)
          ?.map(
            (e) => AdminMenuCategoryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  message: json['message'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$AdminViewResponseModelToJson(
  AdminViewResponseModel instance,
) => <String, dynamic>{
  'employee_list': instance.employeeList,
  'branch_list': instance.branchList,
  'department_list': instance.departmentList,
  'admin_menu_category': instance.adminMenuCategory,
  'message': instance.message,
  'status': instance.status,
};

AdminMenuCategoryModel _$AdminMenuCategoryModelFromJson(
  Map<String, dynamic> json,
) => AdminMenuCategoryModel(
  accessTypeId: json['access_type_id'] as String?,
  accessTypeParentId: json['access_type_parent_id'] as String?,
  accessType: json['access_type'] as String?,
  accessTypeFor: json['access_type_for'] as String?,
  accessTypeImage: json['access_type_image'] as String?,
  accessTypeImageNew: json['access_type_image_new'] as String?,
  adminSubMenu:
      (json['admin_sub_menu'] as List<dynamic>?)
          ?.map((e) => AdminSubMenuModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AdminMenuCategoryModelToJson(
  AdminMenuCategoryModel instance,
) => <String, dynamic>{
  'access_type_id': instance.accessTypeId,
  'access_type_parent_id': instance.accessTypeParentId,
  'access_type': instance.accessType,
  'access_type_for': instance.accessTypeFor,
  'access_type_image': instance.accessTypeImage,
  'access_type_image_new': instance.accessTypeImageNew,
  'admin_sub_menu': instance.adminSubMenu,
};

AdminSubMenuModel _$AdminSubMenuModelFromJson(Map<String, dynamic> json) =>
    AdminSubMenuModel(
      accessTypeId: json['access_type_id'] as String?,
      accessTypeParentId: json['access_type_parent_id'] as String?,
      accessType: json['access_type'] as String?,
      accessTypeFor: json['access_type_for'] as String?,
      accessTypeImage: json['access_type_image'] as String?,
      accessTypeImageNew: json['access_type_image_new'] as String?,
      branchIds: json['branchIds'] as String?,
      departmentIds: json['departmentIds'] as String?,
      employeeIds: json['employeeIds'] as String?,
      isBranchWise: json['isBranchWise'] as bool?,
      isDepartmentWise: json['isDepartmentWise'] as bool?,
      isEmployeeWise: json['isEmployeeWise'] as bool?,
      modificationAccess: json['modification_access'] as bool?,
      pendingCount: json['pending_count'] as String?,
    );

Map<String, dynamic> _$AdminSubMenuModelToJson(AdminSubMenuModel instance) =>
    <String, dynamic>{
      'access_type_id': instance.accessTypeId,
      'access_type_parent_id': instance.accessTypeParentId,
      'access_type': instance.accessType,
      'access_type_for': instance.accessTypeFor,
      'access_type_image': instance.accessTypeImage,
      'access_type_image_new': instance.accessTypeImageNew,
      'branchIds': instance.branchIds,
      'departmentIds': instance.departmentIds,
      'employeeIds': instance.employeeIds,
      'isBranchWise': instance.isBranchWise,
      'isDepartmentWise': instance.isDepartmentWise,
      'isEmployeeWise': instance.isEmployeeWise,
      'modification_access': instance.modificationAccess,
      'pending_count': instance.pendingCount,
    };

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
  blockId: json['block_id'] as String?,
  blockName: json['block_name'] as String?,
);

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'block_id': instance.blockId,
      'block_name': instance.blockName,
    };

DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) =>
    DepartmentModel(
      floorId: json['floor_id'] as String?,
      blockId: json['block_id'] as String?,
      floorName: json['floor_name'] as String?,
      blockName: json['block_name'] as String?,
    );

Map<String, dynamic> _$DepartmentModelToJson(DepartmentModel instance) =>
    <String, dynamic>{
      'floor_id': instance.floorId,
      'block_id': instance.blockId,
      'floor_name': instance.floorName,
      'block_name': instance.blockName,
    };

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      userId: json['user_id'] as String?,
      blockId: json['block_id'] as String?,
      floorId: json['floor_id'] as String?,
      userFullName: json['user_full_name'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      blockName: json['block_name'] as String?,
      floorName: json['floor_name'] as String?,
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'block_id': instance.blockId,
      'floor_id': instance.floorId,
      'user_full_name': instance.userFullName,
      'user_profile_pic': instance.userProfilePic,
      'block_name': instance.blockName,
      'floor_name': instance.floorName,
    };

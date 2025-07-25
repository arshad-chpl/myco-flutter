class AddAssetEntity {
  final List<CategoryEntity>? categoryList;
  final List<BranchEntity>? branchList;
  final List<DepartmentEntity>? departmentList;
  final List<dynamic>? brandList;
  final String? message;

  AddAssetEntity({
    this.categoryList,
    this.branchList,
    this.departmentList,
    this.brandList,
    this.message,
  });
}

class CategoryEntity {
  final String? assetsCategoryId;
  final String? assetsCategory;
  final String? assetsImageRequired;
  final String? snoRequired;
  final bool? assetsImageRequiredBool;
  final bool? snoRequiredBool;
  final bool? brandNameRequired;
  final bool? locationRequired;
  final bool? itemCodeRequired;
  final bool? descriptionRequired;
  final bool? purchaseDateRequired;
  final bool? priceRequired;
  final bool? invoiceRequired;
  final bool? assetCredentialRequired;
  final bool? custodianRequired;

  CategoryEntity({
    this.assetsCategoryId,
    this.assetsCategory,
    this.assetsImageRequired,
    this.snoRequired,
    this.assetsImageRequiredBool,
    this.snoRequiredBool,
    this.brandNameRequired,
    this.locationRequired,
    this.itemCodeRequired,
    this.descriptionRequired,
    this.purchaseDateRequired,
    this.priceRequired,
    this.invoiceRequired,
    this.assetCredentialRequired,
    this.custodianRequired,
  });
}

class BranchEntity {
  final String? blockId;
  final String? blockName;

  BranchEntity({this.blockId, this.blockName});
}

class DepartmentEntity {
  final String? blockId;
  final String? floorId;
  final String? departmentName;

  DepartmentEntity({this.blockId, this.floorId, this.departmentName});
}

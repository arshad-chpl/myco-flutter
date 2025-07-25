class DepartmentAndDesignationListRequest {
  final String? tag;
  final String? companyId;
  final String? branchId;
  final String? languageId;

  const DepartmentAndDesignationListRequest({
    this.tag,
    this.companyId,
    this.branchId,
    this.languageId,
  });

  Map<String, dynamic> toJson() => {
    'getFloorandUnitNew': tag,
    'society_id': companyId,
    'block_id': branchId,
    'language_id': languageId
  };
}
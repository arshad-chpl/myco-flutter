class GetWorkCategoryRequest {
  final String? getWorkCategory;
  final String? companyId;
  final String? languageId;

  GetWorkCategoryRequest({
    this.getWorkCategory,
    this.companyId,
    this.languageId
  });

  Map<String, dynamic> toJson() => {
    'getWorkCategory': getWorkCategory,
    'society_id': companyId,
    'language_id': languageId,
  };
}
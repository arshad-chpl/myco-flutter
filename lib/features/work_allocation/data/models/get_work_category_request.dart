class GetWorkCategoryRequest {
  final String? getWorkCategory;
  final String? societyId;
  final String? languageId;

  GetWorkCategoryRequest({
    this.getWorkCategory,
    this.societyId,
    this.languageId
  });

  Map<String, dynamic> toJson() => {
    'getWorkCategory': getWorkCategory,
    'society_id': societyId,
    'language_id': languageId,
  };
}
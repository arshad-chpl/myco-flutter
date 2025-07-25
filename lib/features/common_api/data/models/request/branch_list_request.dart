class BranchListRequest {
  final String? tag;
  final String? companyId;
  final String? userId;
  final String? languageId;

  const BranchListRequest({
    this.tag,
    this.companyId,
    this.userId,
    this.languageId,
  });

  Map<String, dynamic> toJson() => {
    'getBlocks': tag,
    'society_id': companyId,
    'user_id': userId,
    'language_id': languageId
  };
}
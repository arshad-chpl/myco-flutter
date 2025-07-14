class AdminViewRequest {
  final String? tag;
  final String? companyId;
  final String? userId;
  final String? languageId;
  final bool? isDashboard;
  final String? accessTypeId;
  final bool shouldCache;

  AdminViewRequest({
    this.tag,
    this.companyId,
    this.userId,
    this.languageId,
    this.isDashboard,
    this.accessTypeId,
    this.shouldCache = false,
  });

  Map<String, dynamic> toJson() => {
    'getAdminViewNew': tag,
    'society_id': companyId,
    'user_id': userId,
    'language_id': languageId,
    'isDashBoard': isDashboard,
    'access_type_id': accessTypeId,
  };
}

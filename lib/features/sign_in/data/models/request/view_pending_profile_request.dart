class ViewPendingProfileRequest {
  final String? tag;
  final String? companyId;
  final String? userId;

  const ViewPendingProfileRequest({
    this.tag,
    this.userId,
    this.companyId,
  });

  Map<String, dynamic> toJson() => {
    'ViewPendingProfile': tag,
    'user_id': userId,
    'society_id': companyId
  };
}
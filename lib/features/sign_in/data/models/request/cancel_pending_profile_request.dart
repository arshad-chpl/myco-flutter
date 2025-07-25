class CancelPendingProfileRequest {
  final String? tag;
  final String? userId;
  final String? companyId;

  const CancelPendingProfileRequest({
    this.tag,
    this.userId,
    this.companyId,
  });

  Map<String, dynamic> toJson() => {
    'CancelPendingProfile': tag,
    'user_id': '1992', /*preferenceManager.getKeyValueString(VariableBag.registrationRequestPendingUserId),*/
    'society_id': companyId
  };
}
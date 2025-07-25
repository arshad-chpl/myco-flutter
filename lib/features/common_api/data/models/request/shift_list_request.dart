class ShiftListRequest {
  final String? tag;
  final String? companyId;
  final String? floorId;
  final String? languageId;

  const ShiftListRequest({
    this.tag,
    this.companyId,
    this.floorId,
    this.languageId,
  });

  Map<String, dynamic> toJson() => {
    'getShiftsRegister': tag,
    'society_id': companyId,
    'floor_id': floorId,
    'language_id': '1' /*preferenceManager.getLanguageId()*/
  };
}
class HolidayListRequestModel {
  final String companyId;
  final String unitId;
  final String languageId;
  final String userId;
  final String blockId;
  final String floorId;
  final String levelId;
  final String year;

  HolidayListRequestModel({
    required this.companyId,
    required this.unitId,
    required this.languageId,
    required this.userId,
    required this.blockId,
    required this.floorId,
    required this.levelId,
    required this.year,
  });

  Map<String, dynamic> toMap() => {
    'getHolidaysNewGroupWise': 'getHolidaysNewGroupWise',
    'society_id': companyId,
    'unit_id': unitId,
    'language_id': languageId,
    'user_id': userId,
    'block_id': blockId,
    'floor_id': floorId,
    'level_id': levelId,
    'year': year,
  };
}

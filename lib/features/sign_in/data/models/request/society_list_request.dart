class SocietyListRequest {
  final String? tag;
  final String? countryId;
  final String? companyId;
  final String? stateId;
  final String? cityId;
  final String? companyName;
  final String? languageId;

  const SocietyListRequest({
    this.tag,
    this.countryId,
    this.companyId,
    this.stateId,
    this.cityId,
    this.companyName,
    this.languageId,
  });


  Map<String, dynamic> toJson() => {
    'getSociety': tag,
    'country_id': companyId,
    'state_id': stateId,
    'city_id': cityId,
    'society_id': companyId,
    'company_name': companyName,
    'language_id': languageId
  };
}
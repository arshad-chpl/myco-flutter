class RequestSociety {
      final String? personName;
    final String? personEmail;
    final String? personMobile;
    final String? countryCode;
    final String? address;
    String? device;
    final String? appVersionCode;
    final String? companyName;
    String? companySearchKeyword;
    final String? noOfEmployees;
    String? inquiryType;
    String? languageId;

    RequestSociety({
      this.personName,
      this.personEmail,
      this.personMobile,
      this.countryCode,
      this.address,
      this.device,
      this.appVersionCode,
      this.companyName,
      this.companySearchKeyword,
      this.noOfEmployees,
      this.inquiryType,
      this.languageId,
    });
      Map<String, dynamic> toJson() => {
      'request_society': 'request_society',
      'person_name': personName,
      'person_email': personEmail,
      'person_mobile': personMobile,
      'country_code': countryCode,
      'address': address,
      'device': device,
      'app_version_code': appVersionCode,
      'company_name': companyName,
      'company_search_keyword': companySearchKeyword,
      'no_of_employees': noOfEmployees,
      'inquiry_type': inquiryType,
      'language_id': languageId,
    };

}
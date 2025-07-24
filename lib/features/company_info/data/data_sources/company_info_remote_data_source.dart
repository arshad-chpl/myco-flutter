import 'package:myco_flutter/features/company_info/model/company_info_response.dart';

abstract class CompanyInfoRemoteDataSource {
  Future<CompanyInfoResponseModel> getCompanyInfo();
}
  
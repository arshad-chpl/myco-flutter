import 'package:myco_flutter/features/company_selector/data/models/company_response_model.dart';

abstract class CompanyRemoteDataSource {
  /// Searches for companies based on the provided query.
  ///
  /// Returns a [CompanyResponse] containing the search results.
  Future<CompanyResponseModel> searchCompanies(String query);
  
}
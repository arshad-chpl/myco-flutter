import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/features/payslip/data/models/ctc_details_model.dart';
import 'package:myco_flutter/features/payslip/data/models/get_other_earnings_model.dart';
import 'package:myco_flutter/features/payslip/data/models/salary_details_model.dart';
import 'package:myco_flutter/features/payslip/data/models/salary_model.dart';

abstract class PayslipRemoteDatasources {
  Future<CtcDetailsModel> getCtcDetails();
  Future<SalaryModel> getSalary();
  Future<GetOtherEarningsModel> getOtherEarnings();
  Future<SalaryDetailsModel> getSalaryDetails(String salarySlipId);
  Future<CommonResponseModel> addSalaryIssue(
    String issueMessage,
    String salarySlipId,
  );
}

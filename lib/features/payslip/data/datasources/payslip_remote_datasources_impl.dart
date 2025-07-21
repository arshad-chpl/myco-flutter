import 'dart:convert';
import 'dart:developer';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/payslip/data/datasources/payslip_remote_datasources.dart';
import 'package:myco_flutter/features/payslip/data/models/ctc_details_model.dart';
import 'package:myco_flutter/features/payslip/data/models/get_other_earnings_model.dart';
import 'package:myco_flutter/features/payslip/data/models/salary_details_model.dart';
import 'package:myco_flutter/features/payslip/data/models/salary_model.dart';

class PayslipRemoteDataSourceImpl implements PayslipRemoteDatasources {
  final ApiClient apiClient;

  PayslipRemoteDataSourceImpl({required this.apiClient});

  // View CTC screen (Salary Break Up)
  @override
  Future<CtcDetailsModel> getCtcDetails() async {
    final body = {
      'getCTCDetails': 'getCTCDetails',
      'society_id':
          '1', // to be changed according to the actual society_id from shared preferences
      'language_id': '1',
      'user_id':
          '2', // to be changed according to the actual user_id from shared preferences
    };

    final response = await apiClient.postFormDynamic(
      'salary_controller.php',
      body,
    );
    log(
      response.toString(),
      name: 'THIS IS RESPONSE FROM PAYSLIP REMOTE DATA SOURCE',
    );
    return CtcDetailsModel.fromJson(json.decode(response));
  }

  // Payslip Screen's Payslip tan + View Summary bottomsheet
  @override
  Future<SalaryModel> getSalary() async {
    final body = {
      'getSalaries': 'getSalaries',
      'block_id': '1',
      'language_id': '1',
      'user_id':
          '2', // to be changed according to the actual user_id from shared preferences
      'society_id':
          '1', // to be changed according to the actual society_id from shared preferences
      'floor_id': '1',
      'salary_year': '2024-2025',
    };

    final response = await apiClient.postFormDynamic(
      'salary_controller.php',
      body,
    );

    return SalaryModel.fromJson(json.decode(response));
  }

  @override
  Future<GetOtherEarningsModel> getOtherEarnings() async {
    final body = {
      'getOtherEarning': 'getOtherEarning',
      'society_id': '1',
      'user_id': '553',
      'language_id': '1',
      'leave_payout_year': '2025',
    };

    final response = await apiClient.postFormDynamic(
      'salary_controller.php',
      body,
    );

    return GetOtherEarningsModel.fromJson(json.decode(response));
  }

  @override
  Future<SalaryDetailsModel> getSalaryDetails() async {
    final body = {
      'getSalaryDetails': 'getSalaryDetails',
      'society_id': '1',
      'language_id': '1',
      'user_id': '553',
      'salary_slip_id': '881',
    };

    final response = await apiClient.postFormDynamic(
      'salary_controller.php',
      body,
    );

    return SalaryDetailsModel.fromJson(json.decode(response));
  }
}

import 'package:equatable/equatable.dart';

class GetMyAppointmentsEntityModel extends Equatable {
  final String? getMyAppointments;
  final String? companyId;
  final String? userId;
  final String? languageId;

  const GetMyAppointmentsEntityModel({
    this.getMyAppointments,
    this.companyId,
    this.userId,
    this.languageId,
  });

  @override
  List<Object?> get props => [getMyAppointments, companyId, userId, languageId];
}

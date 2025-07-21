// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponseModel _$AppointmentResponseModelFromJson(
  Map<String, dynamic> json,
) => AppointmentResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  myAppointments:
      (json['my_appointments'] as List<dynamic>?)
          ?.map((e) => MyAppointmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AppointmentResponseModelToJson(
  AppointmentResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'my_appointments': instance.myAppointments,
};

MyAppointmentModel _$MyAppointmentModelFromJson(Map<String, dynamic> json) =>
    MyAppointmentModel(
      appointmentId: json['appointment_id'] as String?,
      userId: json['user_id'] as String?,
      userFullName: json['user_full_name'] as String?,
      userMobile: json['user_mobile'] as String?,
      branchName: json['branch_name'] as String?,
      departmentName: json['department_name'] as String?,
      userDesignation: json['user_designation'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      shortName: json['short_name'] as String?,
      appointmentPlace: json['appointment_place'] as String?,
      appointmentAgenda: json['appointment_agenda'] as String?,
      appointmentDatetime: json['appointment_datetime'] as String?,
      appointmentCreatedDate: json['appointment_created_date'] as String?,
      appointmentByUserId: json['appointment_by_user_id'] as String?,
      appointmentForUserId: json['appointment_for_user_id'] as String?,
      appointmentRejectReason: json['appointment_reject_reason'] as String?,
      appointmentStatusView: json['appointment_status_view'] as String?,
      appointmentStatus: json['appointment_status'] as String?,
    );

Map<String, dynamic> _$MyAppointmentModelToJson(MyAppointmentModel instance) =>
    <String, dynamic>{
      'appointment_id': instance.appointmentId,
      'user_id': instance.userId,
      'user_full_name': instance.userFullName,
      'user_mobile': instance.userMobile,
      'branch_name': instance.branchName,
      'department_name': instance.departmentName,
      'user_designation': instance.userDesignation,
      'user_profile_pic': instance.userProfilePic,
      'short_name': instance.shortName,
      'appointment_place': instance.appointmentPlace,
      'appointment_agenda': instance.appointmentAgenda,
      'appointment_datetime': instance.appointmentDatetime,
      'appointment_created_date': instance.appointmentCreatedDate,
      'appointment_by_user_id': instance.appointmentByUserId,
      'appointment_for_user_id': instance.appointmentForUserId,
      'appointment_reject_reason': instance.appointmentRejectReason,
      'appointment_status_view': instance.appointmentStatusView,
      'appointment_status': instance.appointmentStatus,
    };

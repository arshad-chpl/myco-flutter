import 'package:equatable/equatable.dart';

class AppointmentEntityModel extends Equatable {
  final String? status;
  final String? message;
  final List<MyAppointmentEntity>? myAppointments; 

  const AppointmentEntityModel({
    this.status,
    this.message,
    this.myAppointments,
  });

  @override
  List<Object?> get props => [
    status,
    message,
    myAppointments,
  ];
}

class MyAppointmentEntity extends Equatable {
  final String? appointmentId;
  final String? userId;
  final String? userFullName;
  final String? userMobile;
  final String? branchName;
  final String? departmentName;
  final String? userDesignation;
  final String? userProfilePic;
  final String? shortName;
  final String? appointmentPlace;
  final String? appointmentAgenda;
  final String? appointmentDatetime;
  final String? appointmentCreatedDate;
  final String? appointmentByUserId;
  final String? appointmentForUserId;
  final String? appointmentRejectReason;
  final String? appointmentStatusView;
  final String? appointmentStatus;

  const MyAppointmentEntity({
    this.appointmentId,
    this.userId,
    this.userFullName,
    this.userMobile,
    this.branchName,
    this.departmentName,
    this.userDesignation,
    this.userProfilePic,
    this.shortName,
    this.appointmentPlace,
    this.appointmentAgenda,
    this.appointmentDatetime,
    this.appointmentCreatedDate,
    this.appointmentByUserId,
    this.appointmentForUserId,
    this.appointmentRejectReason,
    this.appointmentStatusView,
    this.appointmentStatus,
  });

  @override
  List<Object?> get props => [
    appointmentId,
    userId,
    userFullName,
    userMobile,
    branchName,
    departmentName,
    userDesignation,
    userProfilePic,
    shortName,
    appointmentPlace,
    appointmentAgenda,
    appointmentDatetime,
    appointmentCreatedDate,
    appointmentByUserId,
    appointmentForUserId,
    appointmentRejectReason,
    appointmentStatusView,
    appointmentStatus,
  ];
}
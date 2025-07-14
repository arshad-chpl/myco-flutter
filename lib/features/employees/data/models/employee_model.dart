class EmployeeModel {
  final String userId;
  final String unitId;
  final String blockId;
  final String floorId;
  final String userFirstName;
  final String userLastName;
  final String userMobile;
  final String userFullName;
  final String shortName;
  final String societyId;
  final String designation;
  final String companyLeaveDate;
  final String companyLeaveDateView;
  final bool isFutureDate;
  final bool userActive;
  final String userProfilePic;

  EmployeeModel({
    required this.userId,
    required this.unitId,
    required this.blockId,
    required this.floorId,
    required this.userFirstName,
    required this.userLastName,
    required this.userMobile,
    required this.userFullName,
    required this.shortName,
    required this.societyId,
    required this.designation,
    required this.companyLeaveDate,
    required this.companyLeaveDateView,
    required this.isFutureDate,
    required this.userActive,
    required this.userProfilePic,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      userId: json['user_id'],
      unitId: json['unit_id'],
      blockId: json['block_id'],
      floorId: json['floor_id'],
      userFirstName: json['user_first_name'],
      userLastName: json['user_last_name'],
      userMobile: json['user_mobile'],
      userFullName: json['user_full_name'],
      shortName: json['short_name'],
      societyId: json['society_id'],
      designation: json['designation'],
      companyLeaveDate: json['company_leave_date'],
      companyLeaveDateView: json['company_leave_date_view'],
      isFutureDate: json['is_future_date'],
      userActive: json['user_active'],
      userProfilePic: json['user_profile_pic'],
    );
}

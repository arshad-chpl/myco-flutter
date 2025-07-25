class ReminderPendingProfileRequest {
  final String? tag;
  final String? userId;
  final String? companyId;
  final String? blockId;
  final String? userFirstName;
  final String? userLastName;
  final String? userFullName;
  final String? areaName;
  final String? blockName;

  const ReminderPendingProfileRequest({
    this.tag,
    this.userId,
    this.companyId,
    this.blockId,
    this.userFirstName,
    this.userLastName,
    this.userFullName,
    this.areaName,
    this.blockName,
  });

  Map<String, dynamic> toJson() => {

    'ReminderPendingProfile':tag,
    'user_id':userId,
    'society_id':companyId,
    'block_id':blockId,
    'user_first_name':userFirstName,
    'user_last_name':userLastName,
    'user_full_name':userFullName,
    'areaName':areaName,
    'blockName':blockName,
  };
}
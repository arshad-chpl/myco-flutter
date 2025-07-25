// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      applyResignation: json['apply_resignation'] as bool?,
      blockStatus: json['block_status'] as String?,
      profileMenu: (json['profileMenu'] as List<dynamic>?)
          ?.map((e) => ProfileMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      praiseList: json['praise_list'] as List<dynamic>?,
      userId: json['user_id'] as String?,
      levelId: json['level_id'] as String?,
      levelName: json['level_name'] as String?,
      parentLevelId: json['parent_level_id'] as String?,
      userFirstName: json['user_first_name'] as String?,
      userLastName: json['user_last_name'] as String?,
      branchName: json['branch_name'] as String?,
      departmentName: json['department_name'] as String?,
      companyEmployeeId: json['company_employee_id'] as String?,
      subDepartmentId: json['sub_department_id'] as String?,
      subDepartmentName: json['sub_department_name'] as String?,
      designation: json['designation'] as String?,
      jobDescription: json['job_description'] as String?,
      userJobDescription: json['user_job_description'] as String?,
      shortName: json['short_name'] as String?,
      userFaceData: json['user_face_data'] as String?,
      faceAddedDate: json['face_added_date'] as String?,
      faceDataImageTwo: json['face_data_image_two'] as String?,
      faceDataImage: json['face_data_image'] as String?,
      faceDataImageTwoIos: json['face_data_image_two_ios'] as String?,
      faceDataImageIos: json['face_data_image_ios'] as String?,
      reportingPersons: json['reporting_persons'] as List<dynamic>?,
      reportingPersonId: json['reporting_person_id'] as String?,
      reportingPerson: json['reporting_person'] as String?,
      reportingPersonLevelName: json['reporting_person_level_name'] as String?,
      reportingPersonUserDesignation:
          json['reporting_person_user_designation'] as String?,
      reportingPersonProfilePic:
          json['reporting_person_profile_pic'] as String?,
      reportingShortName: json['reporting_short_name'] as String?,
      sisterCompanyData: json['sister_company_data'] == null
          ? null
          : SisterCompanyData.fromJson(
              json['sister_company_data'] as Map<String, dynamic>),
      userFullName: json['user_full_name'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      userMobile: json['user_mobile'] as String?,
      userEmail: json['user_email'] as String?,
      personalEmail: json['personal_email'] as String?,
      altMobile: json['alt_mobile'] as String?,
      emergencyNumber: json['emergency_number'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      employeeId: json['employee_id'] as String?,
      memberDateOfBirth: json['member_date_of_birth'] == null
          ? null
          : DateTime.parse(json['member_date_of_birth'] as String),
      bloodGroup: json['blood_group'] as String?,
      gender: json['gender'] as String?,
      userToken: json['user_token'] as String?,
      countryCode: json['country_code'] as String?,
      maritalStatus: json['marital_status'] as String?,
      totalFamilyMembers: json['total_family_members'] as String?,
      nationality: json['nationality'] as String?,
      publicMobile: json['public_mobile'] as bool?,
      memberAccessDenied: json['member_access_denied'] as bool?,
      chatAccessDenied: json['chat_access_denied'] as bool?,
      timlineAccessDenied: json['timline_access_denied'] as bool?,
      personal: (json['personal'] as List<dynamic>?)
          ?.map((e) => Personal.fromJson(e as Map<String, dynamic>))
          .toList(),
      employeementSkills: (json['employeement_skills'] as List<dynamic>?)
          ?.map((e) => EmployeementSkill.fromJson(e as Map<String, dynamic>))
          .toList(),
      contact: (json['contact'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      experience: json['experience'] as List<dynamic>?,
      education: json['education'] as List<dynamic>?,
      socialLink: (json['social_link'] as List<dynamic>?)
          ?.map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      myTeam: (json['my_team'] as List<dynamic>?)
          ?.map((e) => MyTeam.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'apply_resignation': instance.applyResignation,
      'block_status': instance.blockStatus,
      'profileMenu': instance.profileMenu,
      'praise_list': instance.praiseList,
      'user_id': instance.userId,
      'level_id': instance.levelId,
      'level_name': instance.levelName,
      'parent_level_id': instance.parentLevelId,
      'user_first_name': instance.userFirstName,
      'user_last_name': instance.userLastName,
      'branch_name': instance.branchName,
      'department_name': instance.departmentName,
      'company_employee_id': instance.companyEmployeeId,
      'sub_department_id': instance.subDepartmentId,
      'sub_department_name': instance.subDepartmentName,
      'designation': instance.designation,
      'job_description': instance.jobDescription,
      'user_job_description': instance.userJobDescription,
      'short_name': instance.shortName,
      'user_face_data': instance.userFaceData,
      'face_added_date': instance.faceAddedDate,
      'face_data_image_two': instance.faceDataImageTwo,
      'face_data_image': instance.faceDataImage,
      'face_data_image_two_ios': instance.faceDataImageTwoIos,
      'face_data_image_ios': instance.faceDataImageIos,
      'reporting_persons': instance.reportingPersons,
      'reporting_person_id': instance.reportingPersonId,
      'reporting_person': instance.reportingPerson,
      'reporting_person_level_name': instance.reportingPersonLevelName,
      'reporting_person_user_designation':
          instance.reportingPersonUserDesignation,
      'reporting_person_profile_pic': instance.reportingPersonProfilePic,
      'reporting_short_name': instance.reportingShortName,
      'sister_company_data': instance.sisterCompanyData,
      'user_full_name': instance.userFullName,
      'user_profile_pic': instance.userProfilePic,
      'user_mobile': instance.userMobile,
      'user_email': instance.userEmail,
      'personal_email': instance.personalEmail,
      'alt_mobile': instance.altMobile,
      'emergency_number': instance.emergencyNumber,
      'whatsapp_number': instance.whatsappNumber,
      'employee_id': instance.employeeId,
      'member_date_of_birth': instance.memberDateOfBirth?.toIso8601String(),
      'blood_group': instance.bloodGroup,
      'gender': instance.gender,
      'user_token': instance.userToken,
      'country_code': instance.countryCode,
      'marital_status': instance.maritalStatus,
      'total_family_members': instance.totalFamilyMembers,
      'nationality': instance.nationality,
      'public_mobile': instance.publicMobile,
      'member_access_denied': instance.memberAccessDenied,
      'chat_access_denied': instance.chatAccessDenied,
      'timline_access_denied': instance.timlineAccessDenied,
      'personal': instance.personal,
      'employeement_skills': instance.employeementSkills,
      'contact': instance.contact,
      'experience': instance.experience,
      'education': instance.education,
      'social_link': instance.socialLink,
      'my_team': instance.myTeam,
      'message': instance.message,
      'status': instance.status,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      userMobile: json['user_mobile'] as String?,
      altMobile: json['alt_mobile'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      emergencyNumber: json['emergency_number'] as String?,
      userEmail: json['user_email'] as String?,
      personalEmail: json['personal_email'] as String?,
      currentAddress: json['current_address'] as String?,
      permanentAddress: json['permanent_address'] as String?,
      currentAddressLat: json['current_address_lat'] as String?,
      currentAddressLong: json['current_address_long'] as String?,
      permanentAddressLat: json['permanent_address_lat'] as String?,
      permanentAddressLong: json['permanent_address_long'] as String?,
      publicMobile: json['public_mobile'] as bool?,
      userMobileCountryCode: json['user_mobile_country_code'] as String?,
      withoutCountryCodeUserMobile:
          json['without_country_code_user_mobile'] as String?,
      altMobileCountryCode: json['alt_mobile_country_code'] as String?,
      withoutCountryCodeAltMobile:
          json['without_country_code_alt_mobile'] as String?,
      whatsappNumberCountryCode:
          json['whatsapp_number_country_code'] as String?,
      withoutCountryCodeWhatsappNumber:
          json['without_country_code_whatsapp_number'] as String?,
      emergencyNumberCountryCode:
          json['emergency_number_country_code'] as String?,
      withoutCountryCodeEmergencyNumber:
          json['without_country_code_emergency_number'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'user_mobile': instance.userMobile,
      'alt_mobile': instance.altMobile,
      'whatsapp_number': instance.whatsappNumber,
      'emergency_number': instance.emergencyNumber,
      'user_email': instance.userEmail,
      'personal_email': instance.personalEmail,
      'current_address': instance.currentAddress,
      'permanent_address': instance.permanentAddress,
      'current_address_lat': instance.currentAddressLat,
      'current_address_long': instance.currentAddressLong,
      'permanent_address_lat': instance.permanentAddressLat,
      'permanent_address_long': instance.permanentAddressLong,
      'public_mobile': instance.publicMobile,
      'user_mobile_country_code': instance.userMobileCountryCode,
      'without_country_code_user_mobile': instance.withoutCountryCodeUserMobile,
      'alt_mobile_country_code': instance.altMobileCountryCode,
      'without_country_code_alt_mobile': instance.withoutCountryCodeAltMobile,
      'whatsapp_number_country_code': instance.whatsappNumberCountryCode,
      'without_country_code_whatsapp_number':
          instance.withoutCountryCodeWhatsappNumber,
      'emergency_number_country_code': instance.emergencyNumberCountryCode,
      'without_country_code_emergency_number':
          instance.withoutCountryCodeEmergencyNumber,
    };

EmployeementSkill _$EmployeementSkillFromJson(Map<String, dynamic> json) =>
    EmployeementSkill(
      designation: json['designation'] as String?,
      employeeId: json['employee_id'] as String?,
      employmentType: json['employment_type'] as String?,
      joiningDate: json['joining_date'] == null
          ? null
          : DateTime.parse(json['joining_date'] as String),
      joiningDateView: json['joining_date_view'] as String?,
      probationPeriodEndDate: json['probation_period_end_date'] as String?,
      companyExperience: json['company_experience'] as String?,
      totalExperience: json['total_experience'] as String?,
      insuranceNumber: json['insurance_number'] as String?,
      insuranceCompanyName: json['insurance_company_name'] as String?,
      insuranceExpireDate: json['insurance_expire_date'] as String?,
    );

Map<String, dynamic> _$EmployeementSkillToJson(EmployeementSkill instance) =>
    <String, dynamic>{
      'designation': instance.designation,
      'employee_id': instance.employeeId,
      'employment_type': instance.employmentType,
      'joining_date': instance.joiningDate?.toIso8601String(),
      'joining_date_view': instance.joiningDateView,
      'probation_period_end_date': instance.probationPeriodEndDate,
      'company_experience': instance.companyExperience,
      'total_experience': instance.totalExperience,
      'insurance_number': instance.insuranceNumber,
      'insurance_company_name': instance.insuranceCompanyName,
      'insurance_expire_date': instance.insuranceExpireDate,
    };

Personal _$PersonalFromJson(Map<String, dynamic> json) => Personal(
      memberDateOfBirth: json['member_date_of_birth'] == null
          ? null
          : DateTime.parse(json['member_date_of_birth'] as String),
      weddingAnniversaryDate: json['wedding_anniversary_date'] == null
          ? null
          : DateTime.parse(json['wedding_anniversary_date'] as String),
      bloodGroup: json['blood_group'] as String?,
      gender: json['gender'] as String?,
      maritalStatus: json['marital_status'] as String?,
      maritalStatusSt: json['marital_status_st'] as String?,
      totalFamilyMembers: json['total_family_members'] as String?,
      nationality: json['nationality'] as String?,
      memberDateOfBirthView: json['member_date_of_birth_view'] as String?,
      weddingAnniversaryDateView:
          json['wedding_anniversary_date_view'] as String?,
      intrestHobbies: json['intrest_hobbies'] as String?,
      professionalSkills: json['professional_skills'] as String?,
      specialSkills: json['special_skills'] as String?,
      languageKnown: json['language_known'] as String?,
    );

Map<String, dynamic> _$PersonalToJson(Personal instance) => <String, dynamic>{
      'member_date_of_birth': instance.memberDateOfBirth?.toIso8601String(),
      'wedding_anniversary_date':
          instance.weddingAnniversaryDate?.toIso8601String(),
      'blood_group': instance.bloodGroup,
      'gender': instance.gender,
      'marital_status': instance.maritalStatus,
      'marital_status_st': instance.maritalStatusSt,
      'total_family_members': instance.totalFamilyMembers,
      'nationality': instance.nationality,
      'member_date_of_birth_view': instance.memberDateOfBirthView,
      'wedding_anniversary_date_view': instance.weddingAnniversaryDateView,
      'intrest_hobbies': instance.intrestHobbies,
      'professional_skills': instance.professionalSkills,
      'special_skills': instance.specialSkills,
      'language_known': instance.languageKnown,
    };

ProfileMenu _$ProfileMenuFromJson(Map<String, dynamic> json) => ProfileMenu(
      profileMenuId: json['profile_menu_id'] as String?,
      profileMenuName: json['profile_menu_name'] as String?,
      menuClick: json['menu_click'] as String?,
      profileMenuPhoto: json['profile_menu_photo'] as String?,
      profileMenuPhotoNew: json['profile_menu_photo_new'] as String?,
      accessType: json['access_type'] as String?,
      languageKeyName: json['language_key_name'] as String?,
    );

Map<String, dynamic> _$ProfileMenuToJson(ProfileMenu instance) =>
    <String, dynamic>{
      'profile_menu_id': instance.profileMenuId,
      'profile_menu_name': instance.profileMenuName,
      'menu_click': instance.menuClick,
      'profile_menu_photo': instance.profileMenuPhoto,
      'profile_menu_photo_new': instance.profileMenuPhotoNew,
      'access_type': instance.accessType,
      'language_key_name': instance.languageKeyName,
    };

SisterCompanyData _$SisterCompanyDataFromJson(Map<String, dynamic> json) =>
    SisterCompanyData(
      sisterCompanyId: json['sister_company_id'] as String?,
      sisterCompanyName: json['sister_company_name'] as String?,
      sisterCompanyAddress: json['sister_company_address'] as String?,
      sisterCompanyPhone: json['sister_company_phone'] as String?,
      sisterCompanyEmail: json['sister_company_email'] as String?,
      sisterCompanyGstNo: json['sister_company_gst_no'] as String?,
      sisterCompanyWebsite: json['sister_company_website'] as String?,
      sisterCompanyStamp: json['sister_company_stamp'] as String?,
      sisterCompanyLogo: json['sister_company_logo'] as String?,
      sisterCompanyPincode: json['sister_company_pincode'] as String?,
      sisterCompanyPan: json['sister_company_pan'] as String?,
      sisterCompanyLatitude: json['sister_company_latitude'] as String?,
      sisterCompanyLongitude: json['sister_company_longitude'] as String?,
    );

Map<String, dynamic> _$SisterCompanyDataToJson(SisterCompanyData instance) =>
    <String, dynamic>{
      'sister_company_id': instance.sisterCompanyId,
      'sister_company_name': instance.sisterCompanyName,
      'sister_company_address': instance.sisterCompanyAddress,
      'sister_company_phone': instance.sisterCompanyPhone,
      'sister_company_email': instance.sisterCompanyEmail,
      'sister_company_gst_no': instance.sisterCompanyGstNo,
      'sister_company_website': instance.sisterCompanyWebsite,
      'sister_company_stamp': instance.sisterCompanyStamp,
      'sister_company_logo': instance.sisterCompanyLogo,
      'sister_company_pincode': instance.sisterCompanyPincode,
      'sister_company_pan': instance.sisterCompanyPan,
      'sister_company_latitude': instance.sisterCompanyLatitude,
      'sister_company_longitude': instance.sisterCompanyLongitude,
    };

SocialLink _$SocialLinkFromJson(Map<String, dynamic> json) => SocialLink(
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
      linkedin: json['linkedin'] as String?,
      twitter: json['twitter'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      whatsappNumberCountryCode:
          json['whatsapp_number_country_code'] as String?,
      whatsappNumberWithoutCountryCode:
          json['whatsapp_number_without_country_code'] as String?,
    );

Map<String, dynamic> _$SocialLinkToJson(SocialLink instance) =>
    <String, dynamic>{
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'linkedin': instance.linkedin,
      'twitter': instance.twitter,
      'whatsapp_number': instance.whatsappNumber,
      'whatsapp_number_country_code': instance.whatsappNumberCountryCode,
      'whatsapp_number_without_country_code':
          instance.whatsappNumberWithoutCountryCode,
    };

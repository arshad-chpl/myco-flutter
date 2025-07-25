// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      profileMenu: (json['profileMenu'] as List<dynamic>?)
          ?.map((e) => ProfileMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      praiseList: (json['praise_list'] as List<dynamic>?)
          ?.map((e) => PraiseList.fromJson(e as Map<String, dynamic>))
          .toList(),
      personal: (json['personal'] as List<dynamic>?)
          ?.map((e) => Personal.fromJson(e as Map<String, dynamic>))
          .toList(),
      reportingPersons: (json['reporting_persons'] as List<dynamic>?)
          ?.map((e) => ReportingPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
      employeementSkills: (json['employeement_skills'] as List<dynamic>?)
          ?.map((e) => EmployeementSkill.fromJson(e as Map<String, dynamic>))
          .toList(),
      contact: (json['contact'] as List<dynamic>?)
          ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialLink: (json['social_link'] as List<dynamic>?)
          ?.map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      myTeam: (json['my_team'] as List<dynamic>?)
          ?.map((e) => MyTeam.fromJson(e as Map<String, dynamic>))
          .toList(),
      experience: (json['experience'] as List<dynamic>?)
          ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
      education: (json['education'] as List<dynamic>?)
          ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      userId: json['user_id'] as String?,
      employeeId: json['company_employee_id'] as String?,
      shortName: json['short_name'] as String?,
      levelId: json['level_id'] as String?,
      levelName: json['level_name'] as String?,
      parentLevelId: json['parent_level_id'] as String?,
      designation: json['designation'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      userFullName: json['user_full_name'] as String?,
      userMobile: json['user_mobile'] as String?,
      userEmail: json['user_email'] as String?,
      gender: json['gender'] as String?,
      userFirstName: json['user_first_name'] as String?,
      faceDataImage: json['face_data_image'] as String?,
      faceDataImageTwo: json['face_data_image_two'] as String?,
      userLastName: json['user_last_name'] as String?,
      subDepartmentId: json['sub_department_id'] as String?,
      subDepartmentName: json['sub_department_name'] as String?,
      publicMobile: json['public_mobile'] as bool?,
      countryCode: json['country_code'] as String?,
      userToken: json['user_token'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      blockStatus: json['block_status'] as String?,
      branchName: json['branch_name'] as String?,
      departmentName: json['department_name'] as String?,
      applyResignation: json['apply_resignation'] as bool?,
      jobDescription: json['job_description'] as String?,
      userJobDescription: json['user_job_description'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'profileMenu': instance.profileMenu,
      'praise_list': instance.praiseList,
      'personal': instance.personal,
      'reporting_persons': instance.reportingPersons,
      'employeement_skills': instance.employeementSkills,
      'contact': instance.contact,
      'social_link': instance.socialLink,
      'my_team': instance.myTeam,
      'experience': instance.experience,
      'education': instance.education,
      'user_id': instance.userId,
      'company_employee_id': instance.employeeId,
      'short_name': instance.shortName,
      'level_id': instance.levelId,
      'level_name': instance.levelName,
      'parent_level_id': instance.parentLevelId,
      'designation': instance.designation,
      'user_profile_pic': instance.userProfilePic,
      'user_full_name': instance.userFullName,
      'user_mobile': instance.userMobile,
      'user_email': instance.userEmail,
      'gender': instance.gender,
      'user_first_name': instance.userFirstName,
      'face_data_image': instance.faceDataImage,
      'face_data_image_two': instance.faceDataImageTwo,
      'user_last_name': instance.userLastName,
      'sub_department_id': instance.subDepartmentId,
      'sub_department_name': instance.subDepartmentName,
      'public_mobile': instance.publicMobile,
      'country_code': instance.countryCode,
      'user_token': instance.userToken,
      'message': instance.message,
      'status': instance.status,
      'block_status': instance.blockStatus,
      'branch_name': instance.branchName,
      'department_name': instance.departmentName,
      'apply_resignation': instance.applyResignation,
      'job_description': instance.jobDescription,
      'user_job_description': instance.userJobDescription,
    };

ProfileMenu _$ProfileMenuFromJson(Map<String, dynamic> json) => ProfileMenu(
      profileMenuId: json['profile_menu_id'] as String?,
      profileMenuName: json['profile_menu_name'] as String?,
      menuClick: json['menu_click'] as String?,
      languageKeyName: json['language_key_name'] as String?,
      profileMenuPhoto: json['profile_menu_photo'] as String?,
      profileMenuPhotoNew: json['profile_menu_photo_new'] as String?,
      accessType: json['access_type'] as String?,
    );

Map<String, dynamic> _$ProfileMenuToJson(ProfileMenu instance) =>
    <String, dynamic>{
      'profile_menu_id': instance.profileMenuId,
      'profile_menu_name': instance.profileMenuName,
      'menu_click': instance.menuClick,
      'language_key_name': instance.languageKeyName,
      'profile_menu_photo': instance.profileMenuPhoto,
      'profile_menu_photo_new': instance.profileMenuPhotoNew,
      'access_type': instance.accessType,
    };

ReportingPerson _$ReportingPersonFromJson(Map<String, dynamic> json) =>
    ReportingPerson(
      reportingPersonId: json['reporting_person_id'] as String?,
      reportingPerson: json['reporting_person'] as String?,
      reportingPersonLevelName: json['reporting_person_level_name'] as String?,
      reportingPersonUserDesignation:
          json['reporting_person_user_designation'] as String?,
      reportingPersonProfilePic:
          json['reporting_person_profile_pic'] as String?,
      reportingShortName: json['reporting_short_name'] as String?,
    );

Map<String, dynamic> _$ReportingPersonToJson(ReportingPerson instance) =>
    <String, dynamic>{
      'reporting_person_id': instance.reportingPersonId,
      'reporting_person': instance.reportingPerson,
      'reporting_person_level_name': instance.reportingPersonLevelName,
      'reporting_person_user_designation':
          instance.reportingPersonUserDesignation,
      'reporting_person_profile_pic': instance.reportingPersonProfilePic,
      'reporting_short_name': instance.reportingShortName,
    };

PraiseList _$PraiseListFromJson(Map<String, dynamic> json) => PraiseList(
      employeePraiseTypeId: json['employee_praise_type_id'] as String?,
      employeePraiseName: json['employee_praise_name'] as String?,
      employeePraiseContent: json['employee_praise_content'] as String?,
      employeePraiseNameColorCode:
          json['employee_praise_name_color_code'] as String?,
      employeePraiseImage: json['employee_praise_image'] as String?,
      total: json['total'] as String?,
    );

Map<String, dynamic> _$PraiseListToJson(PraiseList instance) =>
    <String, dynamic>{
      'employee_praise_type_id': instance.employeePraiseTypeId,
      'employee_praise_name': instance.employeePraiseName,
      'employee_praise_content': instance.employeePraiseContent,
      'employee_praise_name_color_code': instance.employeePraiseNameColorCode,
      'employee_praise_image': instance.employeePraiseImage,
      'total': instance.total,
    };

Personal _$PersonalFromJson(Map<String, dynamic> json) => Personal(
      memberDateOfBirth: json['member_date_of_birth'] as String?,
      weddingAnniversaryDate: json['wedding_anniversary_date'] as String?,
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
      'member_date_of_birth': instance.memberDateOfBirth,
      'wedding_anniversary_date': instance.weddingAnniversaryDate,
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

Experience _$ExperienceFromJson(Map<String, dynamic> json) => Experience(
      employeeExperienceId: json['employee_experience_id'] as String?,
      designation: json['designation'] as String?,
      expCompanyName: json['exp_company_name'] as String?,
      workFrom: json['work_from'] as String?,
      companyLocation: json['company_location'] as String?,
    );

Map<String, dynamic> _$ExperienceToJson(Experience instance) =>
    <String, dynamic>{
      'employee_experience_id': instance.employeeExperienceId,
      'designation': instance.designation,
      'exp_company_name': instance.expCompanyName,
      'work_from': instance.workFrom,
      'company_location': instance.companyLocation,
    };

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      employeeAchievementId: json['employee_achievement_id'] as String?,
      achievementName: json['achievement_name'] as String?,
      achievementDate: json['achievement_date'] as String?,
      universityBoardName: json['university_board_name'] as String?,
      archiType: json['archi_type'] as String?,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'employee_achievement_id': instance.employeeAchievementId,
      'achievement_name': instance.achievementName,
      'achievement_date': instance.achievementDate,
      'university_board_name': instance.universityBoardName,
      'archi_type': instance.archiType,
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

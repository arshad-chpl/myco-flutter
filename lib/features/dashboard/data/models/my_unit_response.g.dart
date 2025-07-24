// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_unit_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyUnitResponseAdapter extends TypeAdapter<MyUnitResponse> {
  @override
  final int typeId = 5;

  @override
  MyUnitResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyUnitResponse(
      androidLocationTrackingLoopType: fields[0] as String?,
      upcomingEvents: fields[1] as bool?,
      outOfRangePunchInRestrictionMsg: fields[2] as String?,
      outOfRangePunchOutRestrictionMsg: fields[3] as String?,
      todayBirthDays: (fields[4] as List?)?.cast<TodayBirthDay>(),
      managerLevelVisits: fields[5] as String?,
      expireMsg: fields[6] as String?,
      isPlanExpired: fields[7] as bool?,
      wfhApplyType: fields[8] as String?,
      restrictUserProfile: fields[9] as bool?,
      allowZeroProductPriceOrder: fields[10] as bool?,
      customerVisibility: fields[11] as bool?,
      calculateVisitDistance: fields[12] as bool?,
      distanceCalculatingType: fields[13] as String?,
      retailerProductView: fields[14] as String?,
      retailerPhotoRequired: fields[15] as bool?,
      endVisitAttachment: fields[16] as String?,
      onBackEndVisitRequired: fields[17] as bool?,
      hideDistributorSelection: fields[18] as bool?,
      onlyAutoApprovedAttendance: fields[19] as bool?,
      takeEndVisitReason: fields[20] as bool?,
      manageOrderStock: fields[21] as bool?,
      isFinanceYear: fields[22] as bool?,
      appUpdateDailogType: fields[23] as String?,
      multipleCompanyLogin: fields[24] as bool?,
      orderWithoutPunchIn: fields[25] as bool?,
      locationLogEveryMinute: fields[26] as String?,
      shareOrderAccess: fields[27] as bool?,
      cancelOrderAfterConfirm: fields[28] as bool?,
      workReportOn: fields[29] as bool?,
      takeProductPriceFromUser: fields[30] as bool?,
      attendanceType: fields[31] as String?,
      takeAttendanceSelfie: fields[32] as String?,
      hideTimeline: fields[33] as bool?,
      hideChat: fields[34] as bool?,
      hideMyactivity: fields[35] as bool?,
      vpnCheck: fields[36] as bool?,
      socieatyLogo: fields[37] as String?,
      downloadUrlTrackingApp: fields[38] as String?,
      trackingAppVersionAndroid: fields[39] as String?,
      hideAttendanceFaceMenu: fields[40] as bool?,
      hideBirthdayView: fields[41] as bool?,
      hideDepartmentEmployeeView: fields[42] as bool?,
      hideGalleryView: fields[43] as bool?,
      attendanceWithMatchingFace: fields[44] as bool?,
      attendanceWithMatchingFaceIos: fields[45] as bool?,
      byPassRouteList: fields[46] as bool?,
      odometerTracking: fields[47] as bool?,
      hideExpenseTitle: fields[48] as bool?,
      isAmazonFaceMatch: fields[49] as bool?,
      startEndVisitWithFaceMatch: fields[50] as bool?,
      viewSalaryDaysMonthAttendance: fields[51] as bool?,
      restrictDownloading: fields[52] as bool?,
      restrictScreenshot: fields[53] as bool?,
      visitAddExpenseButtonVisibility: fields[54] as bool?,
      dobOnboardingRequired: fields[55] as bool?,
      resignationDateRequiredMarkExEmployee: fields[56] as bool?,
      autoVisitStartEndDefaultTime: fields[57] as String?,
      employeeIdGenerate: fields[58] as bool?,
      employeeIdRequired: fields[59] as bool?,
      employeeMultipleRetailerBinding: fields[60] as String?,
      reminder: (fields[61] as List?)?.cast<dynamic>(),
      logoutIosDevice: fields[62] as bool?,
      userId: fields[63] as String?,
      allowToPreApplyShortLeave: fields[64] as bool?,
      linkPunchInWithVisitStart: fields[65] as bool?,
      visitAutoStartEndInRange: fields[66] as bool?,
      taskAssignToOtherEmployeeAccess: fields[67] as bool?,
      shiftData: (fields[68] as List?)?.cast<dynamic>(),
      isExpenseOn: fields[69] as bool?,
      changeFace: fields[70] as bool?,
      takeAccessibilityPermission: fields[71] as bool?,
      societyId: fields[72] as String?,
      stateIdEmployee: fields[73] as String?,
      takeAttendanceFrom: fields[74] as String?,
      companyEmployeeId: fields[75] as String?,
      shiftTimeId: fields[76] as String?,
      userEmploymentType: fields[77] as String?,
      userFullName: fields[78] as String?,
      userFirstName: fields[79] as String?,
      userLastName: fields[80] as String?,
      activeStatus: fields[81] as String?,
      expenseGradeId: fields[82] as String?,
      userMobile: fields[83] as String?,
      countryCode: fields[84] as String?,
      userEmail: fields[85] as String?,
      userIdProof: fields[86] as dynamic,
      currentAddressLat: fields[87] as String?,
      currentAddressLong: fields[88] as String?,
      permanentAddressLat: fields[89] as String?,
      permanentAddressLong: fields[90] as String?,
      lastAddress: fields[91] as String?,
      permanentAddress: fields[92] as String?,
      facultyUsername: fields[93] as String?,
      facultyPassword: fields[94] as String?,
      facultyToken: fields[95] as String?,
      facultyTokenData: fields[96] as String?,
      isAdminAccess: fields[97] as String?,
      jobLocationNames: fields[98] as String?,
      memberAccessDenied: fields[99] as bool?,
      expenseGradeAssigned: fields[100] as bool?,
      chatAccessDenied: fields[101] as bool?,
      timlineAccessDenied: fields[102] as bool?,
      userVisitingCard: fields[103] as String?,
      userVisitingCardBack: fields[104] as String?,
      shortName: fields[105] as String?,
      blockId: fields[106] as String?,
      blockName: fields[107] as String?,
      floorName: fields[108] as String?,
      baseUrl: fields[109] as String?,
      floorId: fields[110] as String?,
      unitId: fields[111] as String?,
      zoneId: fields[112] as String?,
      branchType: fields[113] as String?,
      levelId: fields[114] as String?,
      workAllocationAddAccess: fields[115] as bool?,
      unitStatus: fields[116] as String?,
      userStatus: fields[117] as String?,
      memberStatus: fields[118] as String?,
      publicMobile: fields[119] as String?,
      visitorApproved: fields[120] as String?,
      memberDateOfBirth: fields[121] as DateTime?,
      weddingAnniversaryDate: fields[122] as String?,
      facebook: fields[123] as String?,
      instagram: fields[124] as String?,
      linkedin: fields[125] as String?,
      userGeofenceLatitude: fields[126] as String?,
      userGeofenceLongitude: fields[127] as String?,
      userGeofenceRange: fields[128] as String?,
      trackUserTime: fields[129] as String?,
      geoFenceInOutNotification: fields[130] as String?,
      userLocationList: (fields[131] as List?)?.cast<dynamic>(),
      blockGeofenceLatitude: fields[132] as String?,
      blockGeofenceLongitude: fields[133] as String?,
      blockGeofenceRange: fields[134] as String?,
      allowWfh: fields[135] as bool?,
      trackUserLocation: fields[136] as bool?,
      addAssetsAccess: fields[137] as bool?,
      parcelSecurityCheck: fields[138] as String?,
      viewOtherAssets: fields[139] as String?,
      addVisitForOther: fields[140] as bool?,
      designation: fields[141] as String?,
      accountDeactive: fields[142] as bool?,
      bloodGroup: fields[143] as String?,
      altMobile: fields[144] as String?,
      countryCodeAlt: fields[145] as String?,
      userProfilePic: fields[146] as String?,
      gender: fields[147] as String?,
      sisterCompanyId: fields[148] as String?,
      companyName: fields[149] as String?,
      companyAddress: fields[150] as String?,
      plotLattitude: fields[151] as String?,
      plotLongitude: fields[152] as String?,
      companyLogo: fields[153] as String?,
      societyAddress: fields[154] as String?,
      societyLatitude: fields[155] as String?,
      societyLongitude: fields[156] as String?,
      societyName: fields[157] as String?,
      countryId: fields[158] as String?,
      stateId: fields[159] as String?,
      cityId: fields[160] as String?,
      cityName: fields[161] as String?,
      currency: fields[162] as String?,
      apiKey: fields[163] as String?,
      isSociety: fields[164] as bool?,
      profileProgress: fields[165] as String?,
      readStatus: fields[166] as String?,
      chatStatus: fields[167] as String?,
      visitorOnOff: fields[168] as String?,
      entryAllVisitorGroup: fields[169] as String?,
      groupChatStatus: fields[170] as String?,
      screenSortCaptureInTimeline: fields[171] as String?,
      createGroup: fields[172] as String?,
      member: (fields[173] as List?)?.cast<Member>(),
      totalEmployeeDepartment: fields[174] as String?,
      myTeam: (fields[175] as List?)?.cast<MyTeam>(),
      eventAlbum: (fields[176] as List?)?.cast<EventAlbum>(),
      unitName: fields[177] as String?,
      message: fields[178] as String?,
      status: fields[179] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MyUnitResponse obj) {
    writer
      ..writeByte(180)
      ..writeByte(0)
      ..write(obj.androidLocationTrackingLoopType)
      ..writeByte(1)
      ..write(obj.upcomingEvents)
      ..writeByte(2)
      ..write(obj.outOfRangePunchInRestrictionMsg)
      ..writeByte(3)
      ..write(obj.outOfRangePunchOutRestrictionMsg)
      ..writeByte(4)
      ..write(obj.todayBirthDays)
      ..writeByte(5)
      ..write(obj.managerLevelVisits)
      ..writeByte(6)
      ..write(obj.expireMsg)
      ..writeByte(7)
      ..write(obj.isPlanExpired)
      ..writeByte(8)
      ..write(obj.wfhApplyType)
      ..writeByte(9)
      ..write(obj.restrictUserProfile)
      ..writeByte(10)
      ..write(obj.allowZeroProductPriceOrder)
      ..writeByte(11)
      ..write(obj.customerVisibility)
      ..writeByte(12)
      ..write(obj.calculateVisitDistance)
      ..writeByte(13)
      ..write(obj.distanceCalculatingType)
      ..writeByte(14)
      ..write(obj.retailerProductView)
      ..writeByte(15)
      ..write(obj.retailerPhotoRequired)
      ..writeByte(16)
      ..write(obj.endVisitAttachment)
      ..writeByte(17)
      ..write(obj.onBackEndVisitRequired)
      ..writeByte(18)
      ..write(obj.hideDistributorSelection)
      ..writeByte(19)
      ..write(obj.onlyAutoApprovedAttendance)
      ..writeByte(20)
      ..write(obj.takeEndVisitReason)
      ..writeByte(21)
      ..write(obj.manageOrderStock)
      ..writeByte(22)
      ..write(obj.isFinanceYear)
      ..writeByte(23)
      ..write(obj.appUpdateDailogType)
      ..writeByte(24)
      ..write(obj.multipleCompanyLogin)
      ..writeByte(25)
      ..write(obj.orderWithoutPunchIn)
      ..writeByte(26)
      ..write(obj.locationLogEveryMinute)
      ..writeByte(27)
      ..write(obj.shareOrderAccess)
      ..writeByte(28)
      ..write(obj.cancelOrderAfterConfirm)
      ..writeByte(29)
      ..write(obj.workReportOn)
      ..writeByte(30)
      ..write(obj.takeProductPriceFromUser)
      ..writeByte(31)
      ..write(obj.attendanceType)
      ..writeByte(32)
      ..write(obj.takeAttendanceSelfie)
      ..writeByte(33)
      ..write(obj.hideTimeline)
      ..writeByte(34)
      ..write(obj.hideChat)
      ..writeByte(35)
      ..write(obj.hideMyactivity)
      ..writeByte(36)
      ..write(obj.vpnCheck)
      ..writeByte(37)
      ..write(obj.socieatyLogo)
      ..writeByte(38)
      ..write(obj.downloadUrlTrackingApp)
      ..writeByte(39)
      ..write(obj.trackingAppVersionAndroid)
      ..writeByte(40)
      ..write(obj.hideAttendanceFaceMenu)
      ..writeByte(41)
      ..write(obj.hideBirthdayView)
      ..writeByte(42)
      ..write(obj.hideDepartmentEmployeeView)
      ..writeByte(43)
      ..write(obj.hideGalleryView)
      ..writeByte(44)
      ..write(obj.attendanceWithMatchingFace)
      ..writeByte(45)
      ..write(obj.attendanceWithMatchingFaceIos)
      ..writeByte(46)
      ..write(obj.byPassRouteList)
      ..writeByte(47)
      ..write(obj.odometerTracking)
      ..writeByte(48)
      ..write(obj.hideExpenseTitle)
      ..writeByte(49)
      ..write(obj.isAmazonFaceMatch)
      ..writeByte(50)
      ..write(obj.startEndVisitWithFaceMatch)
      ..writeByte(51)
      ..write(obj.viewSalaryDaysMonthAttendance)
      ..writeByte(52)
      ..write(obj.restrictDownloading)
      ..writeByte(53)
      ..write(obj.restrictScreenshot)
      ..writeByte(54)
      ..write(obj.visitAddExpenseButtonVisibility)
      ..writeByte(55)
      ..write(obj.dobOnboardingRequired)
      ..writeByte(56)
      ..write(obj.resignationDateRequiredMarkExEmployee)
      ..writeByte(57)
      ..write(obj.autoVisitStartEndDefaultTime)
      ..writeByte(58)
      ..write(obj.employeeIdGenerate)
      ..writeByte(59)
      ..write(obj.employeeIdRequired)
      ..writeByte(60)
      ..write(obj.employeeMultipleRetailerBinding)
      ..writeByte(61)
      ..write(obj.reminder)
      ..writeByte(62)
      ..write(obj.logoutIosDevice)
      ..writeByte(63)
      ..write(obj.userId)
      ..writeByte(64)
      ..write(obj.allowToPreApplyShortLeave)
      ..writeByte(65)
      ..write(obj.linkPunchInWithVisitStart)
      ..writeByte(66)
      ..write(obj.visitAutoStartEndInRange)
      ..writeByte(67)
      ..write(obj.taskAssignToOtherEmployeeAccess)
      ..writeByte(68)
      ..write(obj.shiftData)
      ..writeByte(69)
      ..write(obj.isExpenseOn)
      ..writeByte(70)
      ..write(obj.changeFace)
      ..writeByte(71)
      ..write(obj.takeAccessibilityPermission)
      ..writeByte(72)
      ..write(obj.societyId)
      ..writeByte(73)
      ..write(obj.stateIdEmployee)
      ..writeByte(74)
      ..write(obj.takeAttendanceFrom)
      ..writeByte(75)
      ..write(obj.companyEmployeeId)
      ..writeByte(76)
      ..write(obj.shiftTimeId)
      ..writeByte(77)
      ..write(obj.userEmploymentType)
      ..writeByte(78)
      ..write(obj.userFullName)
      ..writeByte(79)
      ..write(obj.userFirstName)
      ..writeByte(80)
      ..write(obj.userLastName)
      ..writeByte(81)
      ..write(obj.activeStatus)
      ..writeByte(82)
      ..write(obj.expenseGradeId)
      ..writeByte(83)
      ..write(obj.userMobile)
      ..writeByte(84)
      ..write(obj.countryCode)
      ..writeByte(85)
      ..write(obj.userEmail)
      ..writeByte(86)
      ..write(obj.userIdProof)
      ..writeByte(87)
      ..write(obj.currentAddressLat)
      ..writeByte(88)
      ..write(obj.currentAddressLong)
      ..writeByte(89)
      ..write(obj.permanentAddressLat)
      ..writeByte(90)
      ..write(obj.permanentAddressLong)
      ..writeByte(91)
      ..write(obj.lastAddress)
      ..writeByte(92)
      ..write(obj.permanentAddress)
      ..writeByte(93)
      ..write(obj.facultyUsername)
      ..writeByte(94)
      ..write(obj.facultyPassword)
      ..writeByte(95)
      ..write(obj.facultyToken)
      ..writeByte(96)
      ..write(obj.facultyTokenData)
      ..writeByte(97)
      ..write(obj.isAdminAccess)
      ..writeByte(98)
      ..write(obj.jobLocationNames)
      ..writeByte(99)
      ..write(obj.memberAccessDenied)
      ..writeByte(100)
      ..write(obj.expenseGradeAssigned)
      ..writeByte(101)
      ..write(obj.chatAccessDenied)
      ..writeByte(102)
      ..write(obj.timlineAccessDenied)
      ..writeByte(103)
      ..write(obj.userVisitingCard)
      ..writeByte(104)
      ..write(obj.userVisitingCardBack)
      ..writeByte(105)
      ..write(obj.shortName)
      ..writeByte(106)
      ..write(obj.blockId)
      ..writeByte(107)
      ..write(obj.blockName)
      ..writeByte(108)
      ..write(obj.floorName)
      ..writeByte(109)
      ..write(obj.baseUrl)
      ..writeByte(110)
      ..write(obj.floorId)
      ..writeByte(111)
      ..write(obj.unitId)
      ..writeByte(112)
      ..write(obj.zoneId)
      ..writeByte(113)
      ..write(obj.branchType)
      ..writeByte(114)
      ..write(obj.levelId)
      ..writeByte(115)
      ..write(obj.workAllocationAddAccess)
      ..writeByte(116)
      ..write(obj.unitStatus)
      ..writeByte(117)
      ..write(obj.userStatus)
      ..writeByte(118)
      ..write(obj.memberStatus)
      ..writeByte(119)
      ..write(obj.publicMobile)
      ..writeByte(120)
      ..write(obj.visitorApproved)
      ..writeByte(121)
      ..write(obj.memberDateOfBirth)
      ..writeByte(122)
      ..write(obj.weddingAnniversaryDate)
      ..writeByte(123)
      ..write(obj.facebook)
      ..writeByte(124)
      ..write(obj.instagram)
      ..writeByte(125)
      ..write(obj.linkedin)
      ..writeByte(126)
      ..write(obj.userGeofenceLatitude)
      ..writeByte(127)
      ..write(obj.userGeofenceLongitude)
      ..writeByte(128)
      ..write(obj.userGeofenceRange)
      ..writeByte(129)
      ..write(obj.trackUserTime)
      ..writeByte(130)
      ..write(obj.geoFenceInOutNotification)
      ..writeByte(131)
      ..write(obj.userLocationList)
      ..writeByte(132)
      ..write(obj.blockGeofenceLatitude)
      ..writeByte(133)
      ..write(obj.blockGeofenceLongitude)
      ..writeByte(134)
      ..write(obj.blockGeofenceRange)
      ..writeByte(135)
      ..write(obj.allowWfh)
      ..writeByte(136)
      ..write(obj.trackUserLocation)
      ..writeByte(137)
      ..write(obj.addAssetsAccess)
      ..writeByte(138)
      ..write(obj.parcelSecurityCheck)
      ..writeByte(139)
      ..write(obj.viewOtherAssets)
      ..writeByte(140)
      ..write(obj.addVisitForOther)
      ..writeByte(141)
      ..write(obj.designation)
      ..writeByte(142)
      ..write(obj.accountDeactive)
      ..writeByte(143)
      ..write(obj.bloodGroup)
      ..writeByte(144)
      ..write(obj.altMobile)
      ..writeByte(145)
      ..write(obj.countryCodeAlt)
      ..writeByte(146)
      ..write(obj.userProfilePic)
      ..writeByte(147)
      ..write(obj.gender)
      ..writeByte(148)
      ..write(obj.sisterCompanyId)
      ..writeByte(149)
      ..write(obj.companyName)
      ..writeByte(150)
      ..write(obj.companyAddress)
      ..writeByte(151)
      ..write(obj.plotLattitude)
      ..writeByte(152)
      ..write(obj.plotLongitude)
      ..writeByte(153)
      ..write(obj.companyLogo)
      ..writeByte(154)
      ..write(obj.societyAddress)
      ..writeByte(155)
      ..write(obj.societyLatitude)
      ..writeByte(156)
      ..write(obj.societyLongitude)
      ..writeByte(157)
      ..write(obj.societyName)
      ..writeByte(158)
      ..write(obj.countryId)
      ..writeByte(159)
      ..write(obj.stateId)
      ..writeByte(160)
      ..write(obj.cityId)
      ..writeByte(161)
      ..write(obj.cityName)
      ..writeByte(162)
      ..write(obj.currency)
      ..writeByte(163)
      ..write(obj.apiKey)
      ..writeByte(164)
      ..write(obj.isSociety)
      ..writeByte(165)
      ..write(obj.profileProgress)
      ..writeByte(166)
      ..write(obj.readStatus)
      ..writeByte(167)
      ..write(obj.chatStatus)
      ..writeByte(168)
      ..write(obj.visitorOnOff)
      ..writeByte(169)
      ..write(obj.entryAllVisitorGroup)
      ..writeByte(170)
      ..write(obj.groupChatStatus)
      ..writeByte(171)
      ..write(obj.screenSortCaptureInTimeline)
      ..writeByte(172)
      ..write(obj.createGroup)
      ..writeByte(173)
      ..write(obj.member)
      ..writeByte(174)
      ..write(obj.totalEmployeeDepartment)
      ..writeByte(175)
      ..write(obj.myTeam)
      ..writeByte(176)
      ..write(obj.eventAlbum)
      ..writeByte(177)
      ..write(obj.unitName)
      ..writeByte(178)
      ..write(obj.message)
      ..writeByte(179)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyUnitResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EventAlbumAdapter extends TypeAdapter<EventAlbum> {
  @override
  final int typeId = 6;

  @override
  EventAlbum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventAlbum(
      galleryAlbumId: fields[0] as String?,
      albumTitle: fields[1] as String?,
      eventId: fields[2] as String?,
      eventDate: fields[3] as DateTime?,
      blockId: fields[4] as String?,
      floorId: fields[5] as String?,
      uploadDate: fields[6] as String?,
      imageOne: fields[7] as String?,
      galleryType: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EventAlbum obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.galleryAlbumId)
      ..writeByte(1)
      ..write(obj.albumTitle)
      ..writeByte(2)
      ..write(obj.eventId)
      ..writeByte(3)
      ..write(obj.eventDate)
      ..writeByte(4)
      ..write(obj.blockId)
      ..writeByte(5)
      ..write(obj.floorId)
      ..writeByte(6)
      ..write(obj.uploadDate)
      ..writeByte(7)
      ..write(obj.imageOne)
      ..writeByte(8)
      ..write(obj.galleryType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAlbumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MemberAdapter extends TypeAdapter<Member> {
  @override
  final int typeId = 7;

  @override
  Member read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Member(
      userId: fields[0] as String?,
      userFullName: fields[1] as String?,
      userFirstName: fields[2] as String?,
      userLastName: fields[3] as String?,
      userDesignation: fields[4] as String?,
      shortName: fields[5] as String?,
      userProfilePic: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Member obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.userFullName)
      ..writeByte(2)
      ..write(obj.userFirstName)
      ..writeByte(3)
      ..write(obj.userLastName)
      ..writeByte(4)
      ..write(obj.userDesignation)
      ..writeByte(5)
      ..write(obj.shortName)
      ..writeByte(6)
      ..write(obj.userProfilePic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MyTeamAdapter extends TypeAdapter<MyTeam> {
  @override
  final int typeId = 8;

  @override
  MyTeam read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyTeam(
      userId: fields[0] as String?,
      levelId: fields[1] as String?,
      levelName: fields[2] as String?,
      userFullName: fields[3] as String?,
      shortName: fields[4] as String?,
      userDesignation: fields[5] as String?,
      userProfilePic: fields[6] as String?,
      isPresent: fields[7] as bool?,
      statusView: fields[8] as String?,
      isBreak: fields[9] as bool?,
      leaveData: (fields[10] as List?)?.cast<dynamic>(),
      isLeaveFull: fields[11] as bool?,
      isLeaveHalf: fields[12] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MyTeam obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.levelId)
      ..writeByte(2)
      ..write(obj.levelName)
      ..writeByte(3)
      ..write(obj.userFullName)
      ..writeByte(4)
      ..write(obj.shortName)
      ..writeByte(5)
      ..write(obj.userDesignation)
      ..writeByte(6)
      ..write(obj.userProfilePic)
      ..writeByte(7)
      ..write(obj.isPresent)
      ..writeByte(8)
      ..write(obj.statusView)
      ..writeByte(9)
      ..write(obj.isBreak)
      ..writeByte(10)
      ..write(obj.leaveData)
      ..writeByte(11)
      ..write(obj.isLeaveFull)
      ..writeByte(12)
      ..write(obj.isLeaveHalf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTeamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodayBirthDayAdapter extends TypeAdapter<TodayBirthDay> {
  @override
  final int typeId = 9;

  @override
  TodayBirthDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodayBirthDay(
      userId: fields[0] as String?,
      userFullName: fields[1] as String?,
      userDesignation: fields[2] as String?,
      blockName: fields[3] as String?,
      floorName: fields[4] as String?,
      wishId: fields[5] as String?,
      wishReply: fields[6] as String?,
      shortName: fields[7] as String?,
      userProfilePic: fields[8] as String?,
      memberDateOfBirth: fields[9] as String?,
      isBirthDay: fields[10] as bool?,
      isAnniversary: fields[11] as bool?,
      isWorkAnniversary: fields[12] as bool?,
      totalYearView: fields[13] as String?,
      isToday: fields[14] as bool?,
      memberDateOfBirthView: fields[15] as String?,
      joiningDate: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TodayBirthDay obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.userFullName)
      ..writeByte(2)
      ..write(obj.userDesignation)
      ..writeByte(3)
      ..write(obj.blockName)
      ..writeByte(4)
      ..write(obj.floorName)
      ..writeByte(5)
      ..write(obj.wishId)
      ..writeByte(6)
      ..write(obj.wishReply)
      ..writeByte(7)
      ..write(obj.shortName)
      ..writeByte(8)
      ..write(obj.userProfilePic)
      ..writeByte(9)
      ..write(obj.memberDateOfBirth)
      ..writeByte(10)
      ..write(obj.isBirthDay)
      ..writeByte(11)
      ..write(obj.isAnniversary)
      ..writeByte(12)
      ..write(obj.isWorkAnniversary)
      ..writeByte(13)
      ..write(obj.totalYearView)
      ..writeByte(14)
      ..write(obj.isToday)
      ..writeByte(15)
      ..write(obj.memberDateOfBirthView)
      ..writeByte(16)
      ..write(obj.joiningDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodayBirthDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyUnitResponse _$MyUnitResponseFromJson(Map<String, dynamic> json) =>
    MyUnitResponse(
      androidLocationTrackingLoopType:
          json['android_location_tracking_loop_type'] as String?,
      upcomingEvents: json['upcoming_events'] as bool?,
      outOfRangePunchInRestrictionMsg:
          json['out_of_range_punch_in_restriction_msg'] as String?,
      outOfRangePunchOutRestrictionMsg:
          json['out_of_range_punch_out_restriction_msg'] as String?,
      todayBirthDays: (json['today_birth_days'] as List<dynamic>?)
          ?.map((e) => TodayBirthDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      managerLevelVisits: json['manager_level_visits'] as String?,
      expireMsg: json['expire_msg'] as String?,
      isPlanExpired: json['is_plan_expired'] as bool?,
      wfhApplyType: json['wfh_apply_type'] as String?,
      restrictUserProfile: json['restrict_user_profile'] as bool?,
      allowZeroProductPriceOrder:
          json['allow_zero_product_price_order'] as bool?,
      customerVisibility: json['customer_visibility'] as bool?,
      calculateVisitDistance: json['calculate_visit_distance'] as bool?,
      distanceCalculatingType: json['distance_calculating_type'] as String?,
      retailerProductView: json['retailer_product_view'] as String?,
      retailerPhotoRequired: json['retailer_photo_required'] as bool?,
      endVisitAttachment: json['end_visit_attachment'] as String?,
      onBackEndVisitRequired: json['on_back_end_visit_required'] as bool?,
      hideDistributorSelection: json['hide_distributor_selection'] as bool?,
      onlyAutoApprovedAttendance:
          json['only_auto_approved_attendance'] as bool?,
      takeEndVisitReason: json['take_end_visit_reason'] as bool?,
      manageOrderStock: json['manage_order_stock'] as bool?,
      isFinanceYear: json['is_finance_year'] as bool?,
      appUpdateDailogType: json['app_update_dailog_type'] as String?,
      multipleCompanyLogin: json['multiple_company_login'] as bool?,
      orderWithoutPunchIn: json['order_without_punch_in'] as bool?,
      locationLogEveryMinute: json['location_log_every_minute'] as String?,
      shareOrderAccess: json['share_order_access'] as bool?,
      cancelOrderAfterConfirm: json['cancel_order_after_confirm'] as bool?,
      workReportOn: json['work_report_on'] as bool?,
      takeProductPriceFromUser: json['take_product_price_from_user'] as bool?,
      attendanceType: json['attendance_type'] as String?,
      takeAttendanceSelfie: json['take_attendance_selfie'] as String?,
      hideTimeline: json['hide_timeline'] as bool?,
      hideChat: json['hide_chat'] as bool?,
      hideMyactivity: json['hide_myactivity'] as bool?,
      vpnCheck: json['VPNCheck'] as bool?,
      socieatyLogo: json['socieaty_logo'] as String?,
      downloadUrlTrackingApp: json['download_url_tracking_app'] as String?,
      trackingAppVersionAndroid:
          json['tracking_app_version_android'] as String?,
      hideAttendanceFaceMenu: json['hide_attendance_face_menu'] as bool?,
      hideBirthdayView: json['hide_birthday_view'] as bool?,
      hideDepartmentEmployeeView:
          json['hide_department_employee_view'] as bool?,
      hideGalleryView: json['hide_gallery_view'] as bool?,
      attendanceWithMatchingFace:
          json['attendance_with_matching_face'] as bool?,
      attendanceWithMatchingFaceIos:
          json['attendance_with_matching_face_ios'] as bool?,
      byPassRouteList: json['by_pass_route_list'] as bool?,
      odometerTracking: json['odometer_tracking'] as bool?,
      hideExpenseTitle: json['hide_expense_title'] as bool?,
      isAmazonFaceMatch: json['is_amazon_face_match'] as bool?,
      startEndVisitWithFaceMatch:
          json['start_end_visit_with_face_match'] as bool?,
      viewSalaryDaysMonthAttendance:
          json['view_salary_days_month_attendance'] as bool?,
      restrictDownloading: json['restrict_downloading'] as bool?,
      restrictScreenshot: json['restrict_screenshot'] as bool?,
      visitAddExpenseButtonVisibility:
          json['visit_add_expense_button_visibility'] as bool?,
      dobOnboardingRequired: json['dob_onboarding_required'] as bool?,
      resignationDateRequiredMarkExEmployee:
          json['resignation_date_required_mark_ex_employee'] as bool?,
      autoVisitStartEndDefaultTime:
          json['auto_visit_start_end_default_time'] as String?,
      employeeIdGenerate: json['employee_id_generate'] as bool?,
      employeeIdRequired: json['employee_id_required'] as bool?,
      employeeMultipleRetailerBinding:
          json['employee_multiple_retailer_binding'] as String?,
      reminder: json['reminder'] as List<dynamic>?,
      logoutIosDevice: json['logoutIosDevice'] as bool?,
      userId: json['user_id'] as String?,
      allowToPreApplyShortLeave:
          json['allow_to_pre_apply_short_leave'] as bool?,
      linkPunchInWithVisitStart:
          json['link_punch_in_with_visit_start'] as bool?,
      visitAutoStartEndInRange: json['visit_auto_start_end_in_range'] as bool?,
      taskAssignToOtherEmployeeAccess:
          json['task_assign_to_other_employee_access'] as bool?,
      shiftData: json['shift_data'] as List<dynamic>?,
      isExpenseOn: json['is_expense_on'] as bool?,
      changeFace: json['changeFace'] as bool?,
      takeAccessibilityPermission:
          json['take_accessibility_permission'] as bool?,
      societyId: json['society_id'] as String?,
      stateIdEmployee: json['state_id_employee'] as String?,
      takeAttendanceFrom: json['take_attendance_from'] as String?,
      companyEmployeeId: json['company_employee_id'] as String?,
      shiftTimeId: json['shift_time_id'] as String?,
      userEmploymentType: json['user_employment_type'] as String?,
      userFullName: json['user_full_name'] as String?,
      userFirstName: json['user_first_name'] as String?,
      userLastName: json['user_last_name'] as String?,
      activeStatus: json['active_status'] as String?,
      expenseGradeId: json['expense_grade_id'] as String?,
      userMobile: json['user_mobile'] as String?,
      countryCode: json['country_code'] as String?,
      userEmail: json['user_email'] as String?,
      userIdProof: json['user_id_proof'],
      currentAddressLat: json['current_address_lat'] as String?,
      currentAddressLong: json['current_address_long'] as String?,
      permanentAddressLat: json['permanent_address_lat'] as String?,
      permanentAddressLong: json['permanent_address_long'] as String?,
      lastAddress: json['last_address'] as String?,
      permanentAddress: json['permanent_address'] as String?,
      facultyUsername: json['faculty_username'] as String?,
      facultyPassword: json['faculty_password'] as String?,
      facultyToken: json['faculty_token'] as String?,
      facultyTokenData: json['faculty_token_data'] as String?,
      isAdminAccess: json['is_admin_access'] as String?,
      jobLocationNames: json['job_location_names'] as String?,
      memberAccessDenied: json['member_access_denied'] as bool?,
      expenseGradeAssigned: json['expense_grade_assigned'] as bool?,
      chatAccessDenied: json['chat_access_denied'] as bool?,
      timlineAccessDenied: json['timline_access_denied'] as bool?,
      userVisitingCard: json['user_visiting_card'] as String?,
      userVisitingCardBack: json['user_visiting_card_back'] as String?,
      shortName: json['short_name'] as String?,
      blockId: json['block_id'] as String?,
      blockName: json['block_name'] as String?,
      floorName: json['floor_name'] as String?,
      baseUrl: json['base_url'] as String?,
      floorId: json['floor_id'] as String?,
      unitId: json['unit_id'] as String?,
      zoneId: json['zone_id'] as String?,
      branchType: json['branch_type'] as String?,
      levelId: json['level_id'] as String?,
      workAllocationAddAccess: json['work_allocation_add_access'] as bool?,
      unitStatus: json['unit_status'] as String?,
      userStatus: json['user_status'] as String?,
      memberStatus: json['member_status'] as String?,
      publicMobile: json['public_mobile'] as String?,
      visitorApproved: json['visitor_approved'] as String?,
      memberDateOfBirth: json['member_date_of_birth'] == null
          ? null
          : DateTime.parse(json['member_date_of_birth'] as String),
      weddingAnniversaryDate: json['wedding_anniversary_date'] as String?,
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
      linkedin: json['linkedin'] as String?,
      userGeofenceLatitude: json['user_geofence_latitude'] as String?,
      userGeofenceLongitude: json['user_geofence_longitude'] as String?,
      userGeofenceRange: json['user_geofence_range'] as String?,
      trackUserTime: json['track_user_time'] as String?,
      geoFenceInOutNotification:
          json['geo_fence_in_out_notification'] as String?,
      userLocationList: json['user_location_list'] as List<dynamic>?,
      blockGeofenceLatitude: json['block_geofence_latitude'] as String?,
      blockGeofenceLongitude: json['block_geofence_longitude'] as String?,
      blockGeofenceRange: json['block_geofence_range'] as String?,
      allowWfh: json['allow_wfh'] as bool?,
      trackUserLocation: json['track_user_location'] as bool?,
      addAssetsAccess: json['add_assets_access'] as bool?,
      parcelSecurityCheck: json['parcel_security_check'] as String?,
      viewOtherAssets: json['view_other_assets'] as String?,
      addVisitForOther: json['add_visit_for_other'] as bool?,
      designation: json['designation'] as String?,
      accountDeactive: json['account_deactive'] as bool?,
      bloodGroup: json['blood_group'] as String?,
      altMobile: json['alt_mobile'] as String?,
      countryCodeAlt: json['country_code_alt'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      gender: json['gender'] as String?,
      sisterCompanyId: json['sister_company_id'] as String?,
      companyName: json['company_name'] as String?,
      companyAddress: json['company_address'] as String?,
      plotLattitude: json['plot_lattitude'] as String?,
      plotLongitude: json['plot_longitude'] as String?,
      companyLogo: json['company_logo'] as String?,
      societyAddress: json['society_address'] as String?,
      societyLatitude: json['society_latitude'] as String?,
      societyLongitude: json['society_longitude'] as String?,
      societyName: json['society_name'] as String?,
      countryId: json['country_id'] as String?,
      stateId: json['state_id'] as String?,
      cityId: json['city_id'] as String?,
      cityName: json['city_name'] as String?,
      currency: json['currency'] as String?,
      apiKey: json['api_key'] as String?,
      isSociety: json['is_society'] as bool?,
      profileProgress: json['profile_progress'] as String?,
      readStatus: json['read_status'] as String?,
      chatStatus: json['chat_status'] as String?,
      visitorOnOff: json['visitor_on_off'] as String?,
      entryAllVisitorGroup: json['entry_all_visitor_group'] as String?,
      groupChatStatus: json['group_chat_status'] as String?,
      screenSortCaptureInTimeline:
          json['screen_sort_capture_in_timeline'] as String?,
      createGroup: json['create_group'] as String?,
      member: (json['member'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalEmployeeDepartment: json['total_employee_department'] as String?,
      myTeam: (json['my_team'] as List<dynamic>?)
          ?.map((e) => MyTeam.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventAlbum: (json['event_album'] as List<dynamic>?)
          ?.map((e) => EventAlbum.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitName: json['unit_name'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$MyUnitResponseToJson(MyUnitResponse instance) =>
    <String, dynamic>{
      'android_location_tracking_loop_type':
          instance.androidLocationTrackingLoopType,
      'upcoming_events': instance.upcomingEvents,
      'out_of_range_punch_in_restriction_msg':
          instance.outOfRangePunchInRestrictionMsg,
      'out_of_range_punch_out_restriction_msg':
          instance.outOfRangePunchOutRestrictionMsg,
      'today_birth_days': instance.todayBirthDays,
      'manager_level_visits': instance.managerLevelVisits,
      'expire_msg': instance.expireMsg,
      'is_plan_expired': instance.isPlanExpired,
      'wfh_apply_type': instance.wfhApplyType,
      'restrict_user_profile': instance.restrictUserProfile,
      'allow_zero_product_price_order': instance.allowZeroProductPriceOrder,
      'customer_visibility': instance.customerVisibility,
      'calculate_visit_distance': instance.calculateVisitDistance,
      'distance_calculating_type': instance.distanceCalculatingType,
      'retailer_product_view': instance.retailerProductView,
      'retailer_photo_required': instance.retailerPhotoRequired,
      'end_visit_attachment': instance.endVisitAttachment,
      'on_back_end_visit_required': instance.onBackEndVisitRequired,
      'hide_distributor_selection': instance.hideDistributorSelection,
      'only_auto_approved_attendance': instance.onlyAutoApprovedAttendance,
      'take_end_visit_reason': instance.takeEndVisitReason,
      'manage_order_stock': instance.manageOrderStock,
      'is_finance_year': instance.isFinanceYear,
      'app_update_dailog_type': instance.appUpdateDailogType,
      'multiple_company_login': instance.multipleCompanyLogin,
      'order_without_punch_in': instance.orderWithoutPunchIn,
      'location_log_every_minute': instance.locationLogEveryMinute,
      'share_order_access': instance.shareOrderAccess,
      'cancel_order_after_confirm': instance.cancelOrderAfterConfirm,
      'work_report_on': instance.workReportOn,
      'take_product_price_from_user': instance.takeProductPriceFromUser,
      'attendance_type': instance.attendanceType,
      'take_attendance_selfie': instance.takeAttendanceSelfie,
      'hide_timeline': instance.hideTimeline,
      'hide_chat': instance.hideChat,
      'hide_myactivity': instance.hideMyactivity,
      'VPNCheck': instance.vpnCheck,
      'socieaty_logo': instance.socieatyLogo,
      'download_url_tracking_app': instance.downloadUrlTrackingApp,
      'tracking_app_version_android': instance.trackingAppVersionAndroid,
      'hide_attendance_face_menu': instance.hideAttendanceFaceMenu,
      'hide_birthday_view': instance.hideBirthdayView,
      'hide_department_employee_view': instance.hideDepartmentEmployeeView,
      'hide_gallery_view': instance.hideGalleryView,
      'attendance_with_matching_face': instance.attendanceWithMatchingFace,
      'attendance_with_matching_face_ios':
          instance.attendanceWithMatchingFaceIos,
      'by_pass_route_list': instance.byPassRouteList,
      'odometer_tracking': instance.odometerTracking,
      'hide_expense_title': instance.hideExpenseTitle,
      'is_amazon_face_match': instance.isAmazonFaceMatch,
      'start_end_visit_with_face_match': instance.startEndVisitWithFaceMatch,
      'view_salary_days_month_attendance':
          instance.viewSalaryDaysMonthAttendance,
      'restrict_downloading': instance.restrictDownloading,
      'restrict_screenshot': instance.restrictScreenshot,
      'visit_add_expense_button_visibility':
          instance.visitAddExpenseButtonVisibility,
      'dob_onboarding_required': instance.dobOnboardingRequired,
      'resignation_date_required_mark_ex_employee':
          instance.resignationDateRequiredMarkExEmployee,
      'auto_visit_start_end_default_time':
          instance.autoVisitStartEndDefaultTime,
      'employee_id_generate': instance.employeeIdGenerate,
      'employee_id_required': instance.employeeIdRequired,
      'employee_multiple_retailer_binding':
          instance.employeeMultipleRetailerBinding,
      'reminder': instance.reminder,
      'logoutIosDevice': instance.logoutIosDevice,
      'user_id': instance.userId,
      'allow_to_pre_apply_short_leave': instance.allowToPreApplyShortLeave,
      'link_punch_in_with_visit_start': instance.linkPunchInWithVisitStart,
      'visit_auto_start_end_in_range': instance.visitAutoStartEndInRange,
      'task_assign_to_other_employee_access':
          instance.taskAssignToOtherEmployeeAccess,
      'shift_data': instance.shiftData,
      'is_expense_on': instance.isExpenseOn,
      'changeFace': instance.changeFace,
      'take_accessibility_permission': instance.takeAccessibilityPermission,
      'society_id': instance.societyId,
      'state_id_employee': instance.stateIdEmployee,
      'take_attendance_from': instance.takeAttendanceFrom,
      'company_employee_id': instance.companyEmployeeId,
      'shift_time_id': instance.shiftTimeId,
      'user_employment_type': instance.userEmploymentType,
      'user_full_name': instance.userFullName,
      'user_first_name': instance.userFirstName,
      'user_last_name': instance.userLastName,
      'active_status': instance.activeStatus,
      'expense_grade_id': instance.expenseGradeId,
      'user_mobile': instance.userMobile,
      'country_code': instance.countryCode,
      'user_email': instance.userEmail,
      'user_id_proof': instance.userIdProof,
      'current_address_lat': instance.currentAddressLat,
      'current_address_long': instance.currentAddressLong,
      'permanent_address_lat': instance.permanentAddressLat,
      'permanent_address_long': instance.permanentAddressLong,
      'last_address': instance.lastAddress,
      'permanent_address': instance.permanentAddress,
      'faculty_username': instance.facultyUsername,
      'faculty_password': instance.facultyPassword,
      'faculty_token': instance.facultyToken,
      'faculty_token_data': instance.facultyTokenData,
      'is_admin_access': instance.isAdminAccess,
      'job_location_names': instance.jobLocationNames,
      'member_access_denied': instance.memberAccessDenied,
      'expense_grade_assigned': instance.expenseGradeAssigned,
      'chat_access_denied': instance.chatAccessDenied,
      'timline_access_denied': instance.timlineAccessDenied,
      'user_visiting_card': instance.userVisitingCard,
      'user_visiting_card_back': instance.userVisitingCardBack,
      'short_name': instance.shortName,
      'block_id': instance.blockId,
      'block_name': instance.blockName,
      'floor_name': instance.floorName,
      'base_url': instance.baseUrl,
      'floor_id': instance.floorId,
      'unit_id': instance.unitId,
      'zone_id': instance.zoneId,
      'branch_type': instance.branchType,
      'level_id': instance.levelId,
      'work_allocation_add_access': instance.workAllocationAddAccess,
      'unit_status': instance.unitStatus,
      'user_status': instance.userStatus,
      'member_status': instance.memberStatus,
      'public_mobile': instance.publicMobile,
      'visitor_approved': instance.visitorApproved,
      'member_date_of_birth': instance.memberDateOfBirth?.toIso8601String(),
      'wedding_anniversary_date': instance.weddingAnniversaryDate,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'linkedin': instance.linkedin,
      'user_geofence_latitude': instance.userGeofenceLatitude,
      'user_geofence_longitude': instance.userGeofenceLongitude,
      'user_geofence_range': instance.userGeofenceRange,
      'track_user_time': instance.trackUserTime,
      'geo_fence_in_out_notification': instance.geoFenceInOutNotification,
      'user_location_list': instance.userLocationList,
      'block_geofence_latitude': instance.blockGeofenceLatitude,
      'block_geofence_longitude': instance.blockGeofenceLongitude,
      'block_geofence_range': instance.blockGeofenceRange,
      'allow_wfh': instance.allowWfh,
      'track_user_location': instance.trackUserLocation,
      'add_assets_access': instance.addAssetsAccess,
      'parcel_security_check': instance.parcelSecurityCheck,
      'view_other_assets': instance.viewOtherAssets,
      'add_visit_for_other': instance.addVisitForOther,
      'designation': instance.designation,
      'account_deactive': instance.accountDeactive,
      'blood_group': instance.bloodGroup,
      'alt_mobile': instance.altMobile,
      'country_code_alt': instance.countryCodeAlt,
      'user_profile_pic': instance.userProfilePic,
      'gender': instance.gender,
      'sister_company_id': instance.sisterCompanyId,
      'company_name': instance.companyName,
      'company_address': instance.companyAddress,
      'plot_lattitude': instance.plotLattitude,
      'plot_longitude': instance.plotLongitude,
      'company_logo': instance.companyLogo,
      'society_address': instance.societyAddress,
      'society_latitude': instance.societyLatitude,
      'society_longitude': instance.societyLongitude,
      'society_name': instance.societyName,
      'country_id': instance.countryId,
      'state_id': instance.stateId,
      'city_id': instance.cityId,
      'city_name': instance.cityName,
      'currency': instance.currency,
      'api_key': instance.apiKey,
      'is_society': instance.isSociety,
      'profile_progress': instance.profileProgress,
      'read_status': instance.readStatus,
      'chat_status': instance.chatStatus,
      'visitor_on_off': instance.visitorOnOff,
      'entry_all_visitor_group': instance.entryAllVisitorGroup,
      'group_chat_status': instance.groupChatStatus,
      'screen_sort_capture_in_timeline': instance.screenSortCaptureInTimeline,
      'create_group': instance.createGroup,
      'member': instance.member,
      'total_employee_department': instance.totalEmployeeDepartment,
      'my_team': instance.myTeam,
      'event_album': instance.eventAlbum,
      'unit_name': instance.unitName,
      'message': instance.message,
      'status': instance.status,
    };

EventAlbum _$EventAlbumFromJson(Map<String, dynamic> json) => EventAlbum(
      galleryAlbumId: json['gallery_album_id'] as String?,
      albumTitle: json['album_title'] as String?,
      eventId: json['event_id'] as String?,
      eventDate: json['event_date'] == null
          ? null
          : DateTime.parse(json['event_date'] as String),
      blockId: json['block_id'] as String?,
      floorId: json['floor_id'] as String?,
      uploadDate: json['upload_date'] as String?,
      imageOne: json['image_one'] as String?,
      galleryType: json['gallery_type'] as String?,
    );

Map<String, dynamic> _$EventAlbumToJson(EventAlbum instance) =>
    <String, dynamic>{
      'gallery_album_id': instance.galleryAlbumId,
      'album_title': instance.albumTitle,
      'event_id': instance.eventId,
      'event_date': instance.eventDate?.toIso8601String(),
      'block_id': instance.blockId,
      'floor_id': instance.floorId,
      'upload_date': instance.uploadDate,
      'image_one': instance.imageOne,
      'gallery_type': instance.galleryType,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      userId: json['user_id'] as String?,
      userFullName: json['user_full_name'] as String?,
      userFirstName: json['user_first_name'] as String?,
      userLastName: json['user_last_name'] as String?,
      userDesignation: json['user_designation'] as String?,
      shortName: json['short_name'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'user_id': instance.userId,
      'user_full_name': instance.userFullName,
      'user_first_name': instance.userFirstName,
      'user_last_name': instance.userLastName,
      'user_designation': instance.userDesignation,
      'short_name': instance.shortName,
      'user_profile_pic': instance.userProfilePic,
    };

MyTeam _$MyTeamFromJson(Map<String, dynamic> json) => MyTeam(
      userId: json['user_id'] as String?,
      levelId: json['level_id'] as String?,
      levelName: json['level_name'] as String?,
      userFullName: json['user_full_name'] as String?,
      shortName: json['short_name'] as String?,
      userDesignation: json['user_designation'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      isPresent: json['is_present'] as bool?,
      statusView: json['status_view'] as String?,
      isBreak: json['is_break'] as bool?,
      leaveData: json['leave_data'] as List<dynamic>?,
      isLeaveFull: json['is_leave_full'] as bool?,
      isLeaveHalf: json['is_leave_half'] as bool?,
    );

Map<String, dynamic> _$MyTeamToJson(MyTeam instance) => <String, dynamic>{
      'user_id': instance.userId,
      'level_id': instance.levelId,
      'level_name': instance.levelName,
      'user_full_name': instance.userFullName,
      'short_name': instance.shortName,
      'user_designation': instance.userDesignation,
      'user_profile_pic': instance.userProfilePic,
      'is_present': instance.isPresent,
      'status_view': instance.statusView,
      'is_break': instance.isBreak,
      'leave_data': instance.leaveData,
      'is_leave_full': instance.isLeaveFull,
      'is_leave_half': instance.isLeaveHalf,
    };

TodayBirthDay _$TodayBirthDayFromJson(Map<String, dynamic> json) =>
    TodayBirthDay(
      userId: json['user_id'] as String?,
      userFullName: json['user_full_name'] as String?,
      userDesignation: json['user_designation'] as String?,
      blockName: json['block_name'] as String?,
      floorName: json['floor_name'] as String?,
      wishId: json['wish_id'] as String?,
      wishReply: json['wish_reply'] as String?,
      shortName: json['short_name'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      memberDateOfBirth: json['member_date_of_birth'] as String?,
      isBirthDay: json['isBirthDay'] as bool?,
      isAnniversary: json['isAnniversary'] as bool?,
      isWorkAnniversary: json['isWorkAnniversary'] as bool?,
      totalYearView: json['total_year_view'] as String?,
      isToday: json['is_today'] as bool?,
      memberDateOfBirthView: json['member_date_of_birth_view'] as String?,
      joiningDate: json['joining_date'] as String?,
    );

Map<String, dynamic> _$TodayBirthDayToJson(TodayBirthDay instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_full_name': instance.userFullName,
      'user_designation': instance.userDesignation,
      'block_name': instance.blockName,
      'floor_name': instance.floorName,
      'wish_id': instance.wishId,
      'wish_reply': instance.wishReply,
      'short_name': instance.shortName,
      'user_profile_pic': instance.userProfilePic,
      'member_date_of_birth': instance.memberDateOfBirth,
      'isBirthDay': instance.isBirthDay,
      'isAnniversary': instance.isAnniversary,
      'isWorkAnniversary': instance.isWorkAnniversary,
      'total_year_view': instance.totalYearView,
      'is_today': instance.isToday,
      'member_date_of_birth_view': instance.memberDateOfBirthView,
      'joining_date': instance.joiningDate,
    };

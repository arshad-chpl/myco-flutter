class HomeMenuResponseEntity {
  String? gridWidth;
  List<AppMenuEntity>? appmenu;
  List<AppMenuEntity>? appmenuBig;
  List<AppMenuEntity>? appmenuHome;
  String? chatVideo;
  String? timelineVideo;
  String? settingVideo;
  String? homepageVideo;
  String? accessKeyAws;
  String? secretKeyAws;
  List<SliderEntity>? slider;
  String? shareAppContent;
  String? myDistance;
  String? distanceGetType;
  bool? isFirebase;
  bool? chatFirebase;
  String? spBgColourCode;
  String? spBgUrl;
  bool? isUpcommingMaintenance;
  bool? isUnderMaintenance;
  String? festivalName;
  String? festivalNumber;
  String? festivalVideo;
  String? festivalUrl;
  String? festivalDate;
  String? viewStatus;
  String? activeStatus;
  String? advertisementUrl;
  List<MenuCategoryEntity>? menuCategory;
  String? baseUrl;
  String? message;
  String? status;

  HomeMenuResponseEntity({
    this.gridWidth,
    this.appmenu,
    this.appmenuBig,
    this.appmenuHome,
    this.chatVideo,
    this.timelineVideo,
    this.settingVideo,
    this.homepageVideo,
    this.accessKeyAws,
    this.secretKeyAws,
    this.slider,
    this.shareAppContent,
    this.myDistance,
    this.distanceGetType,
    this.isFirebase,
    this.chatFirebase,
    this.spBgColourCode,
    this.spBgUrl,
    this.isUpcommingMaintenance,
    this.isUnderMaintenance,
    this.festivalName,
    this.festivalNumber,
    this.festivalVideo,
    this.festivalUrl,
    this.festivalDate,
    this.viewStatus,
    this.activeStatus,
    this.advertisementUrl,
    this.menuCategory,
    this.baseUrl,
    this.message,
    this.status,
  });
}

class AppMenuEntity {
  String? appMenuId;
  String? menuCategoryId;
  String? menuTitle;
  String? menuLanguageKey;
  String? menuTitleSearch;
  String? menuClick;
  String? iosMenuClick;
  String? menuIcon;
  String? menuIconNew;
  String? menuSequence;
  String? tutorialVideo;
  bool? isNew;
  List<dynamic>? appmenuSub;

  AppMenuEntity({
    this.appMenuId,
    this.menuCategoryId,
    this.menuTitle,
    this.menuLanguageKey,
    this.menuTitleSearch,
    this.menuClick,
    this.iosMenuClick,
    this.menuIcon,
    this.menuIconNew,
    this.menuSequence,
    this.tutorialVideo,
    this.isNew,
    this.appmenuSub,
  });
}

class MenuCategoryEntity {
  String? menuCategoryId;
  String? menuCategoryName;
  String? menuCategoryKey;
  String? menuCategoryIcon;

  MenuCategoryEntity({
    this.menuCategoryId,
    this.menuCategoryName,
    this.menuCategoryKey,
    this.menuCategoryIcon,
  });
}

class SliderEntity {
  String? appSliderId;
  String? societyId;
  String? sliderImageName;
  String? youtubeUrl;
  String? sliderStatus;
  String? pageUrl;
  String? pageMobile;

  SliderEntity({
    this.appSliderId,
    this.societyId,
    this.sliderImageName,
    this.youtubeUrl,
    this.sliderStatus,
    this.pageUrl,
    this.pageMobile,
  });
}

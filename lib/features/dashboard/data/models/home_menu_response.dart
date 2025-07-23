// To parse this JSON data, do
//
//     final homeMenuResponse = homeMenuResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_response_entity.dart';

part 'home_menu_response.g.dart';

HomeMenuResponse homeMenuResponseFromJson(String str) =>
    HomeMenuResponse.fromJson(json.decode(str));

String homeMenuResponseToJson(HomeMenuResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class HomeMenuResponse {
  @JsonKey(name: "grid_width")
  String? gridWidth;
  @JsonKey(name: "appmenu")
  List<Appmenu>? appmenu;
  @JsonKey(name: "appmenu_big")
  List<Appmenu>? appmenuBig;
  @JsonKey(name: "appmenu_home")
  List<Appmenu>? appmenuHome;
  @JsonKey(name: "chat_video")
  String? chatVideo;
  @JsonKey(name: "timeline_video")
  String? timelineVideo;
  @JsonKey(name: "setting_video")
  String? settingVideo;
  @JsonKey(name: "homepage_video")
  String? homepageVideo;
  @JsonKey(name: "accessKeyAws")
  String? accessKeyAws;
  @JsonKey(name: "secretKeyAws")
  String? secretKeyAws;
  @JsonKey(name: "slider")
  List<Slider>? slider;
  @JsonKey(name: "share_app_content")
  String? shareAppContent;
  @JsonKey(name: "my_distance")
  String? myDistance;
  @JsonKey(name: "distance_get_type")
  String? distanceGetType;
  @JsonKey(name: "is_firebase")
  bool? isFirebase;
  @JsonKey(name: "chat_firebase")
  bool? chatFirebase;
  @JsonKey(name: "sp_bg_colour_code")
  String? spBgColourCode;
  @JsonKey(name: "sp_bg_url")
  String? spBgUrl;
  @JsonKey(name: "is_upcomming_maintenance")
  bool? isUpcommingMaintenance;
  @JsonKey(name: "is_under_maintenance")
  bool? isUnderMaintenance;
  @JsonKey(name: "festival_name")
  String? festivalName;
  @JsonKey(name: "festival_number")
  String? festivalNumber;
  @JsonKey(name: "festival_video")
  String? festivalVideo;
  @JsonKey(name: "festival_url")
  String? festivalUrl;
  @JsonKey(name: "festival_date")
  String? festivalDate;
  @JsonKey(name: "view_status")
  String? viewStatus;
  @JsonKey(name: "active_status")
  String? activeStatus;
  @JsonKey(name: "advertisement_url")
  String? advertisementUrl;
  @JsonKey(name: "menu_category")
  List<MenuCategory>? menuCategory;
  @JsonKey(name: "base_url")
  String? baseUrl;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status")
  String? status;

  HomeMenuResponse({
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

  factory HomeMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeMenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeMenuResponseToJson(this);

  /// Converts the HomeMenuResponse data model to a HomeMenuResponseEntity.
  ///
  /// This method maps the JSON fields to their corresponding entity fields.

  HomeMenuResponseEntity toEntity() => HomeMenuResponseEntity(
    gridWidth: gridWidth,
    chatVideo: chatVideo,
    timelineVideo: timelineVideo,
    settingVideo: settingVideo,
    homepageVideo: homepageVideo,
    accessKeyAws: accessKeyAws,
    secretKeyAws: secretKeyAws,
    shareAppContent: shareAppContent,
    myDistance: myDistance,
    distanceGetType: distanceGetType,
    isFirebase: isFirebase,
    chatFirebase: chatFirebase,
    spBgColourCode: spBgColourCode,
    spBgUrl: spBgUrl,
    isUpcommingMaintenance: isUpcommingMaintenance,
    isUnderMaintenance: isUnderMaintenance,
    festivalName: festivalName,
    festivalNumber: festivalNumber,
    festivalVideo: festivalVideo,
    festivalUrl: festivalUrl,
    festivalDate: festivalDate,
    viewStatus: viewStatus,
    activeStatus: activeStatus,
    advertisementUrl: advertisementUrl,
    baseUrl: baseUrl,
    message: message,
    status: status,
    // Map lists by calling toEntity on each item.
    // The '?.' handles cases where the list might be null.
    appmenu: appmenu?.map((item) => item.toEntity()).toList() ?? [],
    appmenuBig: appmenuBig?.map((item) => item.toEntity()).toList() ?? [],
    appmenuHome: appmenuHome?.map((item) => item.toEntity()).toList() ?? [],
    slider: slider?.map((item) => item.toEntity()).toList() ?? [],
    menuCategory: menuCategory?.map((item) => item.toEntity()).toList() ?? [],
  );
}

@JsonSerializable()
class Appmenu {
  @JsonKey(name: "app_menu_id")
  String? appMenuId;
  @JsonKey(name: "menu_category_id")
  String? menuCategoryId;
  @JsonKey(name: "menu_title")
  String? menuTitle;
  @JsonKey(name: "menu_language_key")
  String? menuLanguageKey;
  @JsonKey(name: "menu_title_search")
  String? menuTitleSearch;
  @JsonKey(name: "menu_click")
  String? menuClick;
  @JsonKey(name: "ios_menu_click")
  String? iosMenuClick;
  @JsonKey(name: "menu_icon")
  String? menuIcon;
  @JsonKey(name: "menu_icon_new")
  String? menuIconNew;
  @JsonKey(name: "menu_sequence")
  String? menuSequence;
  @JsonKey(name: "tutorial_video")
  String? tutorialVideo;
  @JsonKey(name: "is_new")
  bool? isNew;
  @JsonKey(name: "appmenu_sub")
  List<dynamic>? appmenuSub;

  Appmenu({
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

  factory Appmenu.fromJson(Map<String, dynamic> json) =>
      _$AppmenuFromJson(json);

  Map<String, dynamic> toJson() => _$AppmenuToJson(this);
  // --- CONVERSION FUNCTION ---
  AppMenuEntity toEntity() {
    return AppMenuEntity(
      appMenuId: appMenuId,
      menuCategoryId: menuCategoryId,
      menuTitle: menuTitle,
      menuLanguageKey: menuLanguageKey,
      menuTitleSearch: menuTitleSearch,
      menuClick: menuClick,
      iosMenuClick: iosMenuClick,
      menuIcon: menuIcon,
      menuIconNew: menuIconNew,
      menuSequence: menuSequence,
      tutorialVideo: tutorialVideo,
      isNew: isNew,
      appmenuSub: appmenuSub,
    );
  }
}

@JsonSerializable()
class MenuCategory {
  @JsonKey(name: "menu_category_id")
  String? menuCategoryId;
  @JsonKey(name: "menu_category_name")
  String? menuCategoryName;
  @JsonKey(name: "menu_category_key")
  String? menuCategoryKey;
  @JsonKey(name: "menu_category_icon")
  String? menuCategoryIcon;

  MenuCategory({
    this.menuCategoryId,
    this.menuCategoryName,
    this.menuCategoryKey,
    this.menuCategoryIcon,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MenuCategoryToJson(this);
  // --- CONVERSION FUNCTION ---
  MenuCategoryEntity toEntity() {
    return MenuCategoryEntity(
      menuCategoryId: menuCategoryId,
      menuCategoryName: menuCategoryName,
      menuCategoryKey: menuCategoryKey,
      menuCategoryIcon: menuCategoryIcon,
    );
  }
}

@JsonSerializable()
class Slider {
  @JsonKey(name: "app_slider_id")
  String? appSliderId;
  @JsonKey(name: "society_id")
  String? societyId;
  @JsonKey(name: "slider_image_name")
  String? sliderImageName;
  @JsonKey(name: "youtube_url")
  String? youtubeUrl;
  @JsonKey(name: "slider_status")
  String? sliderStatus;
  @JsonKey(name: "page_url")
  String? pageUrl;
  @JsonKey(name: "page_mobile")
  String? pageMobile;

  Slider({
    this.appSliderId,
    this.societyId,
    this.sliderImageName,
    this.youtubeUrl,
    this.sliderStatus,
    this.pageUrl,
    this.pageMobile,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => _$SliderFromJson(json);

  Map<String, dynamic> toJson() => _$SliderToJson(this);
  // --- CONVERSION FUNCTION ---
  SliderEntity toEntity() {
    return SliderEntity(
      appSliderId: appSliderId,
      societyId: societyId,
      sliderImageName: sliderImageName,
      youtubeUrl: youtubeUrl,
      sliderStatus: sliderStatus,
      pageUrl: pageUrl,
      pageMobile: pageMobile,
    );
  }
}

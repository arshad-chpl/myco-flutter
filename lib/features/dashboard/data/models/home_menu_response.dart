// To parse this JSON data, do
//
//     final homeMenuResponse = homeMenuResponseFromJson(jsonString);

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

// Assuming your entity file is in the domain layer
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_response_entity.dart';

part 'home_menu_response.g.dart';

HomeMenuResponse homeMenuResponseFromJson(String str) => HomeMenuResponse.fromJson(json.decode(str));

String homeMenuResponseToJson(HomeMenuResponse data) => json.encode(data.toJson());

@HiveType(typeId: 1)
@JsonSerializable()
class HomeMenuResponse {
    @HiveField(0) // Corrected
    @JsonKey(name: "grid_width")
    String? gridWidth;
    @HiveField(1) // Corrected
    @JsonKey(name: "appmenu")
    List<Appmenu>? appmenu;
    @HiveField(2) // Corrected
    @JsonKey(name: "appmenu_big")
    List<Appmenu>? appmenuBig;
    @HiveField(3) // Corrected
    @JsonKey(name: "appmenu_home")
    List<Appmenu>? appmenuHome;
    @HiveField(4) // Corrected
    @JsonKey(name: "chat_video")
    String? chatVideo;
    @HiveField(5) // Corrected
    @JsonKey(name: "timeline_video")
    String? timelineVideo;
    @HiveField(6) // Corrected
    @JsonKey(name: "setting_video")
    String? settingVideo;
    @HiveField(7) // Corrected
    @JsonKey(name: "homepage_video")
    String? homepageVideo;
    @HiveField(8) // Corrected
    @JsonKey(name: "accessKeyAws")
    String? accessKeyAws;
    @HiveField(9) // Corrected
    @JsonKey(name: "secretKeyAws")
    String? secretKeyAws;
    @HiveField(10) // Corrected
    @JsonKey(name: "slider")
    List<Slider>? slider;
    @HiveField(11) // Corrected
    @JsonKey(name: "share_app_content")
    String? shareAppContent;
    @HiveField(12) // Corrected
    @JsonKey(name: "my_distance")
    String? myDistance;
    @HiveField(13) // Corrected
    @JsonKey(name: "distance_get_type")
    String? distanceGetType;
    @HiveField(14) // Corrected
    @JsonKey(name: "is_firebase")
    bool? isFirebase;
    @HiveField(15) // Corrected
    @JsonKey(name: "chat_firebase")
    bool? chatFirebase;
    @HiveField(16) // Corrected
    @JsonKey(name: "sp_bg_colour_code")
    String? spBgColourCode;
    @HiveField(17) // Corrected
    @JsonKey(name: "sp_bg_url")
    String? spBgUrl;
    @HiveField(18) // Corrected
    @JsonKey(name: "is_upcomming_maintenance")
    bool? isUpcommingMaintenance;
    @HiveField(19) // Corrected
    @JsonKey(name: "is_under_maintenance")
    bool? isUnderMaintenance;
    @HiveField(20) // Corrected
    @JsonKey(name: "festival_name")
    String? festivalName;
    @HiveField(21) // Corrected
    @JsonKey(name: "festival_number")
    String? festivalNumber;
    @HiveField(22) // Corrected
    @JsonKey(name: "festival_video")
    String? festivalVideo;
    @HiveField(23) // Corrected
    @JsonKey(name: "festival_url")
    String? festivalUrl;
    @HiveField(24) // Corrected
    @JsonKey(name: "festival_date")
    String? festivalDate;
    @HiveField(25) // Corrected
    @JsonKey(name: "view_status")
    String? viewStatus;
    @HiveField(26) // Corrected
    @JsonKey(name: "active_status")
    String? activeStatus;
    @HiveField(27) // Corrected
    @JsonKey(name: "advertisement_url")
    String? advertisementUrl;
    @HiveField(28) // Corrected
    @JsonKey(name: "menu_category")
    List<MenuCategory>? menuCategory;
    @HiveField(29) // Corrected
    @JsonKey(name: "base_url")
    String? baseUrl;
    @HiveField(30) // Corrected
    @JsonKey(name: "message")
    String? message;
    @HiveField(31) // Corrected
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

    factory HomeMenuResponse.fromJson(Map<String, dynamic> json) => _$HomeMenuResponseFromJson(json);

    Map<String, dynamic> toJson() => _$HomeMenuResponseToJson(this);

    // This function converts the data layer model to a domain layer entity
    HomeMenuResponseEntity toEntity() {
      return HomeMenuResponseEntity(
        gridWidth: gridWidth,
        appmenu: appmenu?.map((e) => e.toEntity()).toList() ?? [],
        appmenuBig: appmenuBig?.map((e) => e.toEntity()).toList() ?? [],
        appmenuHome: appmenuHome?.map((e) => e.toEntity()).toList() ?? [],
        chatVideo: chatVideo,
        timelineVideo: timelineVideo,
        settingVideo: settingVideo,
        homepageVideo: homepageVideo,
        accessKeyAws: accessKeyAws,
        secretKeyAws: secretKeyAws,
        slider: slider?.map((e) => e.toEntity()).toList() ?? [],
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
        menuCategory: menuCategory?.map((e) => e.toEntity()).toList() ?? [],
        baseUrl: baseUrl,
        message: message,
        status: status,
      );
    }
}

@HiveType(typeId: 2)
@JsonSerializable()
class Appmenu {
    @HiveField(0) // Corrected
    @JsonKey(name: "app_menu_id")
    String? appMenuId;
    @HiveField(1) // Corrected
    @JsonKey(name: "menu_category_id")
    String? menuCategoryId;
    @HiveField(2) // Corrected
    @JsonKey(name: "menu_title")
    String? menuTitle;
    @HiveField(3) // Corrected
    @JsonKey(name: "menu_language_key")
    String? menuLanguageKey;
    @HiveField(4) // Corrected
    @JsonKey(name: "menu_title_search")
    String? menuTitleSearch;
    @HiveField(5) // Corrected
    @JsonKey(name: "menu_click")
    String? menuClick;
    @HiveField(6) // Corrected
    @JsonKey(name: "ios_menu_click")
    String? iosMenuClick;
    @HiveField(7) // Corrected
    @JsonKey(name: "menu_icon")
    String? menuIcon;
    @HiveField(8) // Corrected
    @JsonKey(name: "menu_icon_new")
    String? menuIconNew;
    @HiveField(9) // Corrected
    @JsonKey(name: "menu_sequence")
    String? menuSequence;
    @HiveField(10) // Corrected
    @JsonKey(name: "tutorial_video")
    String? tutorialVideo;
    @HiveField(11) // Corrected
    @JsonKey(name: "is_new")
    bool? isNew;
    @HiveField(12) // Corrected
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

    factory Appmenu.fromJson(Map<String, dynamic> json) => _$AppmenuFromJson(json);

    Map<String, dynamic> toJson() => _$AppmenuToJson(this);

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

@HiveType(typeId: 3)
@JsonSerializable()
class MenuCategory {
    @HiveField(0) // Corrected
    @JsonKey(name: "menu_category_id")
    String? menuCategoryId;
    @HiveField(1) // Corrected
    @JsonKey(name: "menu_category_name")
    String? menuCategoryName;
    @HiveField(2) // Corrected
    @JsonKey(name: "menu_category_key")
    String? menuCategoryKey;
    @HiveField(3) // Corrected
    @JsonKey(name: "menu_category_icon")
    String? menuCategoryIcon;

    MenuCategory({
        this.menuCategoryId,
        this.menuCategoryName,
        this.menuCategoryKey,
        this.menuCategoryIcon,
    });

    factory MenuCategory.fromJson(Map<String, dynamic> json) => _$MenuCategoryFromJson(json);

    Map<String, dynamic> toJson() => _$MenuCategoryToJson(this);

    MenuCategoryEntity toEntity() {
      return MenuCategoryEntity(
        menuCategoryId: menuCategoryId,
        menuCategoryName: menuCategoryName,
        menuCategoryKey: menuCategoryKey,
        menuCategoryIcon: menuCategoryIcon,
      );
    }
}

@HiveType(typeId: 4)
@JsonSerializable()
class Slider {
    @HiveField(0) // Corrected
    @JsonKey(name: "app_slider_id")
    String? appSliderId;
    @HiveField(1) // Corrected
    @JsonKey(name: "society_id")
    String? societyId;
    @HiveField(2) // Corrected
    @JsonKey(name: "slider_image_name")
    String? sliderImageName;
    @HiveField(3) // Corrected
    @JsonKey(name: "youtube_url")
    String? youtubeUrl;
    @HiveField(4) // Corrected
    @JsonKey(name: "slider_status")
    String? sliderStatus;
    @HiveField(5) // Corrected
    @JsonKey(name: "page_url")
    String? pageUrl;
    @HiveField(6) // Corrected
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

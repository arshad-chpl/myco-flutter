// To parse this JSON data, do
//
//     final homeMenuResponseEntity = homeMenuResponseEntityFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'home_menu_response_entity.g.dart';

HomeMenuResponseEntity homeMenuResponseEntityFromJson(String str) => HomeMenuResponseEntity.fromJson(json.decode(str));

String homeMenuResponseEntityToJson(HomeMenuResponseEntity data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class HomeMenuResponseEntity {
    @HiveField(1)
    String? gridWidth;
    @HiveField(2)
    List<AppMenuEntity>? appmenu;
    @HiveField(3)
    List<AppMenuEntity>? appmenuBig;
    @HiveField(4)
    List<AppMenuEntity>? appmenuHome;
    @HiveField(5)
    String? chatVideo;
    @HiveField(6)
    String? timelineVideo;
    @HiveField(7)
    String? settingVideo;
    @HiveField(8)
    String? homepageVideo;
    @HiveField(9)
    String? accessKeyAws;
    @HiveField(10)
    String? secretKeyAws;
    @HiveField(11)
    List<SliderEntity>? slider;
    @HiveField(12)
    String? shareAppContent;
    @HiveField(13)
    String? myDistance;
    @HiveField(14)
    String? distanceGetType;
    @HiveField(15)
    bool? isFirebase;
    @HiveField(16)
    bool? chatFirebase;
    @HiveField(17)
    String? spBgColourCode;
    @HiveField(18)
    String? spBgUrl;
    @HiveField(19)
    bool? isUpcommingMaintenance;
    @HiveField(20)
    bool? isUnderMaintenance;
    @HiveField(21)
    String? festivalName;
    @HiveField(22)
    String? festivalNumber;
    @HiveField(23)
    String? festivalVideo;
    @HiveField(24)
    String? festivalUrl;
    @HiveField(25)
    String? festivalDate;
    @HiveField(26)
    String? viewStatus;
    @HiveField(27)
    String? activeStatus;
    @HiveField(28)
    String? advertisementUrl;
    @HiveField(29)
    List<MenuCategoryEntity>? menuCategory;
    @HiveField(30)
    String? baseUrl;
    @HiveField(31)
    String? message;
    @HiveField(32)
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

    factory HomeMenuResponseEntity.fromJson(Map<String, dynamic> json) => HomeMenuResponseEntity(
        gridWidth: json["grid_width"],
        appmenu: json["appmenu"] == null ? [] : List<AppMenuEntity>.from(json["appmenu"]!.map((x) => AppMenuEntity.fromJson(x))),
        appmenuBig: json["appmenu_big"] == null ? [] : List<AppMenuEntity>.from(json["appmenu_big"]!.map((x) => AppMenuEntity.fromJson(x))),
        appmenuHome: json["appmenu_home"] == null ? [] : List<AppMenuEntity>.from(json["appmenu_home"]!.map((x) => AppMenuEntity.fromJson(x))),
        chatVideo: json["chat_video"],
        timelineVideo: json["timeline_video"],
        settingVideo: json["setting_video"],
        homepageVideo: json["homepage_video"],
        accessKeyAws: json["accessKeyAws"],
        secretKeyAws: json["secretKeyAws"],
        slider: json["slider"] == null ? [] : List<SliderEntity>.from(json["slider"]!.map((x) => SliderEntity.fromJson(x))),
        shareAppContent: json["share_app_content"],
        myDistance: json["my_distance"],
        distanceGetType: json["distance_get_type"],
        isFirebase: json["is_firebase"],
        chatFirebase: json["chat_firebase"],
        spBgColourCode: json["sp_bg_colour_code"],
        spBgUrl: json["sp_bg_url"],
        isUpcommingMaintenance: json["is_upcomming_maintenance"],
        isUnderMaintenance: json["is_under_maintenance"],
        festivalName: json["festival_name"],
        festivalNumber: json["festival_number"],
        festivalVideo: json["festival_video"],
        festivalUrl: json["festival_url"],
        festivalDate: json["festival_date"],
        viewStatus: json["view_status"],
        activeStatus: json["active_status"],
        advertisementUrl: json["advertisement_url"],
        menuCategory: json["menu_category"] == null ? [] : List<MenuCategoryEntity>.from(json["menu_category"]!.map((x) => MenuCategoryEntity.fromJson(x))),
        baseUrl: json["base_url"],
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "grid_width": gridWidth,
        "appmenu": appmenu == null ? [] : List<dynamic>.from(appmenu!.map((x) => x.toJson())),
        "appmenu_big": appmenuBig == null ? [] : List<dynamic>.from(appmenuBig!.map((x) => x.toJson())),
        "appmenu_home": appmenuHome == null ? [] : List<dynamic>.from(appmenuHome!.map((x) => x.toJson())),
        "chat_video": chatVideo,
        "timeline_video": timelineVideo,
        "setting_video": settingVideo,
        "homepage_video": homepageVideo,
        "accessKeyAws": accessKeyAws,
        "secretKeyAws": secretKeyAws,
        "slider": slider == null ? [] : List<dynamic>.from(slider!.map((x) => x.toJson())),
        "share_app_content": shareAppContent,
        "my_distance": myDistance,
        "distance_get_type": distanceGetType,
        "is_firebase": isFirebase,
        "chat_firebase": chatFirebase,
        "sp_bg_colour_code": spBgColourCode,
        "sp_bg_url": spBgUrl,
        "is_upcomming_maintenance": isUpcommingMaintenance,
        "is_under_maintenance": isUnderMaintenance,
        "festival_name": festivalName,
        "festival_number": festivalNumber,
        "festival_video": festivalVideo,
        "festival_url": festivalUrl,
        "festival_date": festivalDate,
        "view_status": viewStatus,
        "active_status": activeStatus,
        "advertisement_url": advertisementUrl,
        "menu_category": menuCategory == null ? [] : List<dynamic>.from(menuCategory!.map((x) => x.toJson())),
        "base_url": baseUrl,
        "message": message,
        "status": status,
    };
}

@HiveType(typeId: 2)
class AppMenuEntity {
    @HiveField(1)
    String? appMenuId;
    @HiveField(2)
    String? menuCategoryId;
    @HiveField(3)
    String? menuTitle;
    @HiveField(4)
    String? menuLanguageKey;
    @HiveField(5)
    String? menuTitleSearch;
    @HiveField(6)
    String? menuClick;
    @HiveField(7)
    String? iosMenuClick;
    @HiveField(8)
    String? menuIcon;
    @HiveField(9)
    String? menuIconNew;
    @HiveField(10)
    String? menuSequence;
    @HiveField(11)
    String? tutorialVideo;
    @HiveField(12)
    bool? isNew;
    @HiveField(13)
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

    factory AppMenuEntity.fromJson(Map<String, dynamic> json) => AppMenuEntity(
        appMenuId: json["app_menu_id"],
        menuCategoryId: json["menu_category_id"],
        menuTitle: json["menu_title"],
        menuLanguageKey: json["menu_language_key"],
        menuTitleSearch: json["menu_title_search"],
        menuClick: json["menu_click"],
        iosMenuClick: json["ios_menu_click"],
        menuIcon: json["menu_icon"],
        menuIconNew: json["menu_icon_new"],
        menuSequence: json["menu_sequence"],
        tutorialVideo: json["tutorial_video"],
        isNew: json["is_new"],
        appmenuSub: json["appmenu_sub"] == null ? [] : List<dynamic>.from(json["appmenu_sub"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "app_menu_id": appMenuId,
        "menu_category_id": menuCategoryId,
        "menu_title": menuTitle,
        "menu_language_key": menuLanguageKey,
        "menu_title_search": menuTitleSearch,
        "menu_click": menuClick,
        "ios_menu_click": iosMenuClick,
        "menu_icon": menuIcon,
        "menu_icon_new": menuIconNew,
        "menu_sequence": menuSequence,
        "tutorial_video": tutorialVideo,
        "is_new": isNew,
        "appmenu_sub": appmenuSub == null ? [] : List<dynamic>.from(appmenuSub!.map((x) => x)),
    };
}

@HiveType(typeId: 3)
class MenuCategoryEntity {
    @HiveField(1)
    String? menuCategoryId;
    @HiveField(2)
    String? menuCategoryName;
    @HiveField(3)
    String? menuCategoryKey;
    @HiveField(4)
    String? menuCategoryIcon;

    MenuCategoryEntity({
        this.menuCategoryId,
        this.menuCategoryName,
        this.menuCategoryKey,
        this.menuCategoryIcon,
    });

    factory MenuCategoryEntity.fromJson(Map<String, dynamic> json) => MenuCategoryEntity(
        menuCategoryId: json["menu_category_id"],
        menuCategoryName: json["menu_category_name"],
        menuCategoryKey: json["menu_category_key"],
        menuCategoryIcon: json["menu_category_icon"],
    );

    Map<String, dynamic> toJson() => {
        "menu_category_id": menuCategoryId,
        "menu_category_name": menuCategoryName,
        "menu_category_key": menuCategoryKey,
        "menu_category_icon": menuCategoryIcon,
    };
}

@HiveType(typeId: 4)
class SliderEntity {
    @HiveField(1)
    String? appSliderId;
    @HiveField(2)
    String? societyId;
    @HiveField(3)
    String? sliderImageName;
    @HiveField(4)
    String? youtubeUrl;
    @HiveField(5)
    String? sliderStatus;
    @HiveField(6)
    String? pageUrl;
    @HiveField(7)
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

    factory SliderEntity.fromJson(Map<String, dynamic> json) => SliderEntity(
        appSliderId: json["app_slider_id"],
        societyId: json["society_id"],
        sliderImageName: json["slider_image_name"],
        youtubeUrl: json["youtube_url"],
        sliderStatus: json["slider_status"],
        pageUrl: json["page_url"],
        pageMobile: json["page_mobile"],
    );

    Map<String, dynamic> toJson() => {
        "app_slider_id": appSliderId,
        "society_id": societyId,
        "slider_image_name": sliderImageName,
        "youtube_url": youtubeUrl,
        "slider_status": sliderStatus,
        "page_url": pageUrl,
        "page_mobile": pageMobile,
    };
}


// class HomeMenuResponseEntity {
//   String? gridWidth;
//   List<AppMenuEntity>? appmenu;
//   List<AppMenuEntity>? appmenuBig;
//   List<AppMenuEntity>? appmenuHome;
//   String? chatVideo;
//   String? timelineVideo;
//   String? settingVideo;
//   String? homepageVideo;
//   String? accessKeyAws;
//   String? secretKeyAws;
//   List<SliderEntity>? slider;
//   String? shareAppContent;
//   String? myDistance;
//   String? distanceGetType;
//   bool? isFirebase;
//   bool? chatFirebase;
//   String? spBgColourCode;
//   String? spBgUrl;
//   bool? isUpcommingMaintenance;
//   bool? isUnderMaintenance;
//   String? festivalName;
//   String? festivalNumber;
//   String? festivalVideo;
//   String? festivalUrl;
//   String? festivalDate;
//   String? viewStatus;
//   String? activeStatus;
//   String? advertisementUrl;
//   List<MenuCategoryEntity>? menuCategory;
//   String? baseUrl;
//   String? message;
//   String? status;

//   HomeMenuResponseEntity({
//     this.gridWidth,
//     this.appmenu,
//     this.appmenuBig,
//     this.appmenuHome,
//     this.chatVideo,
//     this.timelineVideo,
//     this.settingVideo,
//     this.homepageVideo,
//     this.accessKeyAws,
//     this.secretKeyAws,
//     this.slider,
//     this.shareAppContent,
//     this.myDistance,
//     this.distanceGetType,
//     this.isFirebase,
//     this.chatFirebase,
//     this.spBgColourCode,
//     this.spBgUrl,
//     this.isUpcommingMaintenance,
//     this.isUnderMaintenance,
//     this.festivalName,
//     this.festivalNumber,
//     this.festivalVideo,
//     this.festivalUrl,
//     this.festivalDate,
//     this.viewStatus,
//     this.activeStatus,
//     this.advertisementUrl,
//     this.menuCategory,
//     this.baseUrl,
//     this.message,
//     this.status,
//   });
// }

// class AppMenuEntity {
//   String? appMenuId;
//   String? menuCategoryId;
//   String? menuTitle;
//   String? menuLanguageKey;
//   String? menuTitleSearch;
//   String? menuClick;
//   String? iosMenuClick;
//   String? menuIcon;
//   String? menuIconNew;
//   String? menuSequence;
//   String? tutorialVideo;
//   bool? isNew;
//   List<dynamic>? appmenuSub;

//   AppMenuEntity({
//     this.appMenuId,
//     this.menuCategoryId,
//     this.menuTitle,
//     this.menuLanguageKey,
//     this.menuTitleSearch,
//     this.menuClick,
//     this.iosMenuClick,
//     this.menuIcon,
//     this.menuIconNew,
//     this.menuSequence,
//     this.tutorialVideo,
//     this.isNew,
//     this.appmenuSub,
//   });
// }

// class MenuCategoryEntity {
//   String? menuCategoryId;
//   String? menuCategoryName;
//   String? menuCategoryKey;
//   String? menuCategoryIcon;

//   MenuCategoryEntity({
//     this.menuCategoryId,
//     this.menuCategoryName,
//     this.menuCategoryKey,
//     this.menuCategoryIcon,
//   });
// }

// class SliderEntity {
//   String? appSliderId;
//   String? societyId;
//   String? sliderImageName;
//   String? youtubeUrl;
//   String? sliderStatus;
//   String? pageUrl;
//   String? pageMobile;

//   SliderEntity({
//     this.appSliderId,
//     this.societyId,
//     this.sliderImageName,
//     this.youtubeUrl,
//     this.sliderStatus,
//     this.pageUrl,
//     this.pageMobile,
//   });
// }

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeMenuResponse _$HomeMenuResponseFromJson(Map<String, dynamic> json) =>
    HomeMenuResponse(
      gridWidth: json['grid_width'] as String?,
      appmenu: (json['appmenu'] as List<dynamic>?)
          ?.map((e) => Appmenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      appmenuBig: (json['appmenu_big'] as List<dynamic>?)
          ?.map((e) => Appmenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      appmenuHome: (json['appmenu_home'] as List<dynamic>?)
          ?.map((e) => Appmenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      chatVideo: json['chat_video'] as String?,
      timelineVideo: json['timeline_video'] as String?,
      settingVideo: json['setting_video'] as String?,
      homepageVideo: json['homepage_video'] as String?,
      accessKeyAws: json['accessKeyAws'] as String?,
      secretKeyAws: json['secretKeyAws'] as String?,
      slider: (json['slider'] as List<dynamic>?)
          ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
          .toList(),
      shareAppContent: json['share_app_content'] as String?,
      myDistance: json['my_distance'] as String?,
      distanceGetType: json['distance_get_type'] as String?,
      isFirebase: json['is_firebase'] as bool?,
      chatFirebase: json['chat_firebase'] as bool?,
      spBgColourCode: json['sp_bg_colour_code'] as String?,
      spBgUrl: json['sp_bg_url'] as String?,
      isUpcommingMaintenance: json['is_upcomming_maintenance'] as bool?,
      isUnderMaintenance: json['is_under_maintenance'] as bool?,
      festivalName: json['festival_name'] as String?,
      festivalNumber: json['festival_number'] as String?,
      festivalVideo: json['festival_video'] as String?,
      festivalUrl: json['festival_url'] as String?,
      festivalDate: json['festival_date'] as String?,
      viewStatus: json['view_status'] as String?,
      activeStatus: json['active_status'] as String?,
      advertisementUrl: json['advertisement_url'] as String?,
      menuCategory: (json['menu_category'] as List<dynamic>?)
          ?.map((e) => MenuCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseUrl: json['base_url'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$HomeMenuResponseToJson(HomeMenuResponse instance) =>
    <String, dynamic>{
      'grid_width': instance.gridWidth,
      'appmenu': instance.appmenu,
      'appmenu_big': instance.appmenuBig,
      'appmenu_home': instance.appmenuHome,
      'chat_video': instance.chatVideo,
      'timeline_video': instance.timelineVideo,
      'setting_video': instance.settingVideo,
      'homepage_video': instance.homepageVideo,
      'accessKeyAws': instance.accessKeyAws,
      'secretKeyAws': instance.secretKeyAws,
      'slider': instance.slider,
      'share_app_content': instance.shareAppContent,
      'my_distance': instance.myDistance,
      'distance_get_type': instance.distanceGetType,
      'is_firebase': instance.isFirebase,
      'chat_firebase': instance.chatFirebase,
      'sp_bg_colour_code': instance.spBgColourCode,
      'sp_bg_url': instance.spBgUrl,
      'is_upcomming_maintenance': instance.isUpcommingMaintenance,
      'is_under_maintenance': instance.isUnderMaintenance,
      'festival_name': instance.festivalName,
      'festival_number': instance.festivalNumber,
      'festival_video': instance.festivalVideo,
      'festival_url': instance.festivalUrl,
      'festival_date': instance.festivalDate,
      'view_status': instance.viewStatus,
      'active_status': instance.activeStatus,
      'advertisement_url': instance.advertisementUrl,
      'menu_category': instance.menuCategory,
      'base_url': instance.baseUrl,
      'message': instance.message,
      'status': instance.status,
    };

Appmenu _$AppmenuFromJson(Map<String, dynamic> json) => Appmenu(
      appMenuId: json['app_menu_id'] as String?,
      menuCategoryId: json['menu_category_id'] as String?,
      menuTitle: json['menu_title'] as String?,
      menuLanguageKey: json['menu_language_key'] as String?,
      menuTitleSearch: json['menu_title_search'] as String?,
      menuClick: json['menu_click'] as String?,
      iosMenuClick: json['ios_menu_click'] as String?,
      menuIcon: json['menu_icon'] as String?,
      menuIconNew: json['menu_icon_new'] as String?,
      menuSequence: json['menu_sequence'] as String?,
      tutorialVideo: json['tutorial_video'] as String?,
      isNew: json['is_new'] as bool?,
      appmenuSub: json['appmenu_sub'] as List<dynamic>?,
    );

Map<String, dynamic> _$AppmenuToJson(Appmenu instance) => <String, dynamic>{
      'app_menu_id': instance.appMenuId,
      'menu_category_id': instance.menuCategoryId,
      'menu_title': instance.menuTitle,
      'menu_language_key': instance.menuLanguageKey,
      'menu_title_search': instance.menuTitleSearch,
      'menu_click': instance.menuClick,
      'ios_menu_click': instance.iosMenuClick,
      'menu_icon': instance.menuIcon,
      'menu_icon_new': instance.menuIconNew,
      'menu_sequence': instance.menuSequence,
      'tutorial_video': instance.tutorialVideo,
      'is_new': instance.isNew,
      'appmenu_sub': instance.appmenuSub,
    };

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) => MenuCategory(
      menuCategoryId: json['menu_category_id'] as String?,
      menuCategoryName: json['menu_category_name'] as String?,
      menuCategoryKey: json['menu_category_key'] as String?,
      menuCategoryIcon: json['menu_category_icon'] as String?,
    );

Map<String, dynamic> _$MenuCategoryToJson(MenuCategory instance) =>
    <String, dynamic>{
      'menu_category_id': instance.menuCategoryId,
      'menu_category_name': instance.menuCategoryName,
      'menu_category_key': instance.menuCategoryKey,
      'menu_category_icon': instance.menuCategoryIcon,
    };

Slider _$SliderFromJson(Map<String, dynamic> json) => Slider(
      appSliderId: json['app_slider_id'] as String?,
      societyId: json['society_id'] as String?,
      sliderImageName: json['slider_image_name'] as String?,
      youtubeUrl: json['youtube_url'] as String?,
      sliderStatus: json['slider_status'] as String?,
      pageUrl: json['page_url'] as String?,
      pageMobile: json['page_mobile'] as String?,
    );

Map<String, dynamic> _$SliderToJson(Slider instance) => <String, dynamic>{
      'app_slider_id': instance.appSliderId,
      'society_id': instance.societyId,
      'slider_image_name': instance.sliderImageName,
      'youtube_url': instance.youtubeUrl,
      'slider_status': instance.sliderStatus,
      'page_url': instance.pageUrl,
      'page_mobile': instance.pageMobile,
    };

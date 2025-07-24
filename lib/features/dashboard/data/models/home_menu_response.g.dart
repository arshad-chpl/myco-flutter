// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_menu_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeMenuResponseAdapter extends TypeAdapter<HomeMenuResponse> {
  @override
  final int typeId = 1;

  @override
  HomeMenuResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeMenuResponse(
      gridWidth: fields[0] as String?,
      appmenu: (fields[1] as List?)?.cast<Appmenu>(),
      appmenuBig: (fields[2] as List?)?.cast<Appmenu>(),
      appmenuHome: (fields[3] as List?)?.cast<Appmenu>(),
      chatVideo: fields[4] as String?,
      timelineVideo: fields[5] as String?,
      settingVideo: fields[6] as String?,
      homepageVideo: fields[7] as String?,
      accessKeyAws: fields[8] as String?,
      secretKeyAws: fields[9] as String?,
      slider: (fields[10] as List?)?.cast<Slider>(),
      shareAppContent: fields[11] as String?,
      myDistance: fields[12] as String?,
      distanceGetType: fields[13] as String?,
      isFirebase: fields[14] as bool?,
      chatFirebase: fields[15] as bool?,
      spBgColourCode: fields[16] as String?,
      spBgUrl: fields[17] as String?,
      isUpcommingMaintenance: fields[18] as bool?,
      isUnderMaintenance: fields[19] as bool?,
      festivalName: fields[20] as String?,
      festivalNumber: fields[21] as String?,
      festivalVideo: fields[22] as String?,
      festivalUrl: fields[23] as String?,
      festivalDate: fields[24] as String?,
      viewStatus: fields[25] as String?,
      activeStatus: fields[26] as String?,
      advertisementUrl: fields[27] as String?,
      menuCategory: (fields[28] as List?)?.cast<MenuCategory>(),
      baseUrl: fields[29] as String?,
      message: fields[30] as String?,
      status: fields[31] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeMenuResponse obj) {
    writer
      ..writeByte(32)
      ..writeByte(0)
      ..write(obj.gridWidth)
      ..writeByte(1)
      ..write(obj.appmenu)
      ..writeByte(2)
      ..write(obj.appmenuBig)
      ..writeByte(3)
      ..write(obj.appmenuHome)
      ..writeByte(4)
      ..write(obj.chatVideo)
      ..writeByte(5)
      ..write(obj.timelineVideo)
      ..writeByte(6)
      ..write(obj.settingVideo)
      ..writeByte(7)
      ..write(obj.homepageVideo)
      ..writeByte(8)
      ..write(obj.accessKeyAws)
      ..writeByte(9)
      ..write(obj.secretKeyAws)
      ..writeByte(10)
      ..write(obj.slider)
      ..writeByte(11)
      ..write(obj.shareAppContent)
      ..writeByte(12)
      ..write(obj.myDistance)
      ..writeByte(13)
      ..write(obj.distanceGetType)
      ..writeByte(14)
      ..write(obj.isFirebase)
      ..writeByte(15)
      ..write(obj.chatFirebase)
      ..writeByte(16)
      ..write(obj.spBgColourCode)
      ..writeByte(17)
      ..write(obj.spBgUrl)
      ..writeByte(18)
      ..write(obj.isUpcommingMaintenance)
      ..writeByte(19)
      ..write(obj.isUnderMaintenance)
      ..writeByte(20)
      ..write(obj.festivalName)
      ..writeByte(21)
      ..write(obj.festivalNumber)
      ..writeByte(22)
      ..write(obj.festivalVideo)
      ..writeByte(23)
      ..write(obj.festivalUrl)
      ..writeByte(24)
      ..write(obj.festivalDate)
      ..writeByte(25)
      ..write(obj.viewStatus)
      ..writeByte(26)
      ..write(obj.activeStatus)
      ..writeByte(27)
      ..write(obj.advertisementUrl)
      ..writeByte(28)
      ..write(obj.menuCategory)
      ..writeByte(29)
      ..write(obj.baseUrl)
      ..writeByte(30)
      ..write(obj.message)
      ..writeByte(31)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeMenuResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppmenuAdapter extends TypeAdapter<Appmenu> {
  @override
  final int typeId = 2;

  @override
  Appmenu read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Appmenu(
      appMenuId: fields[0] as String?,
      menuCategoryId: fields[1] as String?,
      menuTitle: fields[2] as String?,
      menuLanguageKey: fields[3] as String?,
      menuTitleSearch: fields[4] as String?,
      menuClick: fields[5] as String?,
      iosMenuClick: fields[6] as String?,
      menuIcon: fields[7] as String?,
      menuIconNew: fields[8] as String?,
      menuSequence: fields[9] as String?,
      tutorialVideo: fields[10] as String?,
      isNew: fields[11] as bool?,
      appmenuSub: (fields[12] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Appmenu obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.appMenuId)
      ..writeByte(1)
      ..write(obj.menuCategoryId)
      ..writeByte(2)
      ..write(obj.menuTitle)
      ..writeByte(3)
      ..write(obj.menuLanguageKey)
      ..writeByte(4)
      ..write(obj.menuTitleSearch)
      ..writeByte(5)
      ..write(obj.menuClick)
      ..writeByte(6)
      ..write(obj.iosMenuClick)
      ..writeByte(7)
      ..write(obj.menuIcon)
      ..writeByte(8)
      ..write(obj.menuIconNew)
      ..writeByte(9)
      ..write(obj.menuSequence)
      ..writeByte(10)
      ..write(obj.tutorialVideo)
      ..writeByte(11)
      ..write(obj.isNew)
      ..writeByte(12)
      ..write(obj.appmenuSub);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppmenuAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MenuCategoryAdapter extends TypeAdapter<MenuCategory> {
  @override
  final int typeId = 3;

  @override
  MenuCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuCategory(
      menuCategoryId: fields[0] as String?,
      menuCategoryName: fields[1] as String?,
      menuCategoryKey: fields[2] as String?,
      menuCategoryIcon: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MenuCategory obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.menuCategoryId)
      ..writeByte(1)
      ..write(obj.menuCategoryName)
      ..writeByte(2)
      ..write(obj.menuCategoryKey)
      ..writeByte(3)
      ..write(obj.menuCategoryIcon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SliderAdapter extends TypeAdapter<Slider> {
  @override
  final int typeId = 4;

  @override
  Slider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Slider(
      appSliderId: fields[0] as String?,
      societyId: fields[1] as String?,
      sliderImageName: fields[2] as String?,
      youtubeUrl: fields[3] as String?,
      sliderStatus: fields[4] as String?,
      pageUrl: fields[5] as String?,
      pageMobile: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Slider obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.appSliderId)
      ..writeByte(1)
      ..write(obj.societyId)
      ..writeByte(2)
      ..write(obj.sliderImageName)
      ..writeByte(3)
      ..write(obj.youtubeUrl)
      ..writeByte(4)
      ..write(obj.sliderStatus)
      ..writeByte(5)
      ..write(obj.pageUrl)
      ..writeByte(6)
      ..write(obj.pageMobile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SliderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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

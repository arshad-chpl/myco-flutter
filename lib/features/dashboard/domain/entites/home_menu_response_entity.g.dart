// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_menu_response_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeMenuResponseEntityAdapter
    extends TypeAdapter<HomeMenuResponseEntity> {
  @override
  final int typeId = 1;

  @override
  HomeMenuResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeMenuResponseEntity(
      gridWidth: fields[1] as String?,
      appmenu: (fields[2] as List?)?.cast<AppMenuEntity>(),
      appmenuBig: (fields[3] as List?)?.cast<AppMenuEntity>(),
      appmenuHome: (fields[4] as List?)?.cast<AppMenuEntity>(),
      chatVideo: fields[5] as String?,
      timelineVideo: fields[6] as String?,
      settingVideo: fields[7] as String?,
      homepageVideo: fields[8] as String?,
      accessKeyAws: fields[9] as String?,
      secretKeyAws: fields[10] as String?,
      slider: (fields[11] as List?)?.cast<SliderEntity>(),
      shareAppContent: fields[12] as String?,
      myDistance: fields[13] as String?,
      distanceGetType: fields[14] as String?,
      isFirebase: fields[15] as bool?,
      chatFirebase: fields[16] as bool?,
      spBgColourCode: fields[17] as String?,
      spBgUrl: fields[18] as String?,
      isUpcommingMaintenance: fields[19] as bool?,
      isUnderMaintenance: fields[20] as bool?,
      festivalName: fields[21] as String?,
      festivalNumber: fields[22] as String?,
      festivalVideo: fields[23] as String?,
      festivalUrl: fields[24] as String?,
      festivalDate: fields[25] as String?,
      viewStatus: fields[26] as String?,
      activeStatus: fields[27] as String?,
      advertisementUrl: fields[28] as String?,
      menuCategory: (fields[29] as List?)?.cast<MenuCategoryEntity>(),
      baseUrl: fields[30] as String?,
      message: fields[31] as String?,
      status: fields[32] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeMenuResponseEntity obj) {
    writer
      ..writeByte(32)
      ..writeByte(1)
      ..write(obj.gridWidth)
      ..writeByte(2)
      ..write(obj.appmenu)
      ..writeByte(3)
      ..write(obj.appmenuBig)
      ..writeByte(4)
      ..write(obj.appmenuHome)
      ..writeByte(5)
      ..write(obj.chatVideo)
      ..writeByte(6)
      ..write(obj.timelineVideo)
      ..writeByte(7)
      ..write(obj.settingVideo)
      ..writeByte(8)
      ..write(obj.homepageVideo)
      ..writeByte(9)
      ..write(obj.accessKeyAws)
      ..writeByte(10)
      ..write(obj.secretKeyAws)
      ..writeByte(11)
      ..write(obj.slider)
      ..writeByte(12)
      ..write(obj.shareAppContent)
      ..writeByte(13)
      ..write(obj.myDistance)
      ..writeByte(14)
      ..write(obj.distanceGetType)
      ..writeByte(15)
      ..write(obj.isFirebase)
      ..writeByte(16)
      ..write(obj.chatFirebase)
      ..writeByte(17)
      ..write(obj.spBgColourCode)
      ..writeByte(18)
      ..write(obj.spBgUrl)
      ..writeByte(19)
      ..write(obj.isUpcommingMaintenance)
      ..writeByte(20)
      ..write(obj.isUnderMaintenance)
      ..writeByte(21)
      ..write(obj.festivalName)
      ..writeByte(22)
      ..write(obj.festivalNumber)
      ..writeByte(23)
      ..write(obj.festivalVideo)
      ..writeByte(24)
      ..write(obj.festivalUrl)
      ..writeByte(25)
      ..write(obj.festivalDate)
      ..writeByte(26)
      ..write(obj.viewStatus)
      ..writeByte(27)
      ..write(obj.activeStatus)
      ..writeByte(28)
      ..write(obj.advertisementUrl)
      ..writeByte(29)
      ..write(obj.menuCategory)
      ..writeByte(30)
      ..write(obj.baseUrl)
      ..writeByte(31)
      ..write(obj.message)
      ..writeByte(32)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeMenuResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AppMenuEntityAdapter extends TypeAdapter<AppMenuEntity> {
  @override
  final int typeId = 2;

  @override
  AppMenuEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppMenuEntity(
      appMenuId: fields[1] as String?,
      menuCategoryId: fields[2] as String?,
      menuTitle: fields[3] as String?,
      menuLanguageKey: fields[4] as String?,
      menuTitleSearch: fields[5] as String?,
      menuClick: fields[6] as String?,
      iosMenuClick: fields[7] as String?,
      menuIcon: fields[8] as String?,
      menuIconNew: fields[9] as String?,
      menuSequence: fields[10] as String?,
      tutorialVideo: fields[11] as String?,
      isNew: fields[12] as bool?,
      appmenuSub: (fields[13] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, AppMenuEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.appMenuId)
      ..writeByte(2)
      ..write(obj.menuCategoryId)
      ..writeByte(3)
      ..write(obj.menuTitle)
      ..writeByte(4)
      ..write(obj.menuLanguageKey)
      ..writeByte(5)
      ..write(obj.menuTitleSearch)
      ..writeByte(6)
      ..write(obj.menuClick)
      ..writeByte(7)
      ..write(obj.iosMenuClick)
      ..writeByte(8)
      ..write(obj.menuIcon)
      ..writeByte(9)
      ..write(obj.menuIconNew)
      ..writeByte(10)
      ..write(obj.menuSequence)
      ..writeByte(11)
      ..write(obj.tutorialVideo)
      ..writeByte(12)
      ..write(obj.isNew)
      ..writeByte(13)
      ..write(obj.appmenuSub);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppMenuEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MenuCategoryEntityAdapter extends TypeAdapter<MenuCategoryEntity> {
  @override
  final int typeId = 3;

  @override
  MenuCategoryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuCategoryEntity(
      menuCategoryId: fields[1] as String?,
      menuCategoryName: fields[2] as String?,
      menuCategoryKey: fields[3] as String?,
      menuCategoryIcon: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MenuCategoryEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.menuCategoryId)
      ..writeByte(2)
      ..write(obj.menuCategoryName)
      ..writeByte(3)
      ..write(obj.menuCategoryKey)
      ..writeByte(4)
      ..write(obj.menuCategoryIcon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuCategoryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SliderEntityAdapter extends TypeAdapter<SliderEntity> {
  @override
  final int typeId = 4;

  @override
  SliderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SliderEntity(
      appSliderId: fields[1] as String?,
      societyId: fields[2] as String?,
      sliderImageName: fields[3] as String?,
      youtubeUrl: fields[4] as String?,
      sliderStatus: fields[5] as String?,
      pageUrl: fields[6] as String?,
      pageMobile: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SliderEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.appSliderId)
      ..writeByte(2)
      ..write(obj.societyId)
      ..writeByte(3)
      ..write(obj.sliderImageName)
      ..writeByte(4)
      ..write(obj.youtubeUrl)
      ..writeByte(5)
      ..write(obj.sliderStatus)
      ..writeByte(6)
      ..write(obj.pageUrl)
      ..writeByte(7)
      ..write(obj.pageMobile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SliderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

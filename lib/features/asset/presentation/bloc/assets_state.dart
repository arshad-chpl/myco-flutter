import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/asset/domain/entities/all_assets_entity.dart';
import 'package:myco_flutter/features/asset/domain/entities/asset_entity.dart';

class AssetsFilterState {
  final String category;
  final String brand;

  AssetsFilterState({required this.category, required this.brand});
}

// abstract class AssetsState extends Equatable {
//   final int selectedIndex;
//   const AssetsState({required this.selectedIndex});
//   @override
//   List<Object?> get props => [selectedIndex];
// }

// class AssetsInitial extends AssetsState {
//   const AssetsInitial() : super(selectedIndex: 0);
// }

// class AssetsLoading extends AssetsState {
//   const AssetsLoading({required super.selectedIndex});
// }

// class AssetsLoaded extends AssetsState {
//   final List<AssetEntity> activeAssets;
//   final List<AssetEntity> pastAssets;
//   final List<AssetEntity> allAssets;
//   final List<AssetEntity> currentAssets;

//   const AssetsLoaded({
//     required super.selectedIndex,
//     required this.activeAssets,
//     required this.pastAssets,
//     required this.allAssets,
//     required this.currentAssets,
//   });

//   @override
//   List<Object?> get props => [
//     activeAssets,
//     pastAssets,
//     allAssets,
//     currentAssets,
//     selectedIndex,
//   ];

//   AssetsLoaded copyWith({
//     List<AssetEntity>? activeAssets,
//     List<AssetEntity>? pastAssets,
//     List<AssetEntity>? allAssets,
//     List<AssetEntity>? currentAssets,
//     int? selectedIndex,
//   }) => AssetsLoaded(
//     activeAssets: activeAssets ?? this.activeAssets,
//     pastAssets: pastAssets ?? this.pastAssets,
//     allAssets: allAssets ?? this.allAssets,
//     currentAssets: currentAssets ?? this.currentAssets,
//     selectedIndex: selectedIndex ?? this.selectedIndex,
//   );
// }

// class AssetsError extends AssetsState {
//   final String message;

//   const AssetsError({required this.message, required super.selectedIndex});

//   @override
//   List<Object?> get props => [message, selectedIndex];
// }

abstract class AssetsState extends Equatable {
  final int selectedIndex;
  const AssetsState({required this.selectedIndex});
  @override
  List<Object?> get props => [selectedIndex];
}

class AssetsInitial extends AssetsState {
  const AssetsInitial() : super(selectedIndex: 0);
}

class AssetsLoading extends AssetsState {
  const AssetsLoading({required super.selectedIndex});
}

class AssetsLoaded extends AssetsState {
  // ───────────────────── Raw Lists ─────────────────────
  final List<AssetEntity> activeAssets;
  final List<AssetEntity> pastAssets;
  final List<AssetDetailEntity> allAssets;

  // The list the UI is currently showing. It can be either
  // AssetEntity or AssetDetailEntity, so we use `dynamic`.
  final List<dynamic> currentAssets;

  // Filters meta-data (only meaningful for tab 2)
  final List<CategoryListEntity> categories;
  final List<BrandListEntity> brands;
  final String appliedCategory;
  final String appliedBrand;

  const AssetsLoaded({
    required super.selectedIndex,
    required this.activeAssets,
    required this.pastAssets,
    required this.allAssets,
    required this.currentAssets,
    required this.categories,
    required this.brands,
    required this.appliedCategory,
    required this.appliedBrand,
  });

  @override
  List<Object?> get props => [
    activeAssets,
    pastAssets,
    allAssets,
    currentAssets,
    categories,
    brands,
    appliedCategory,
    appliedBrand,
    selectedIndex,
  ];

  AssetsLoaded copyWith({
    List<AssetEntity>? activeAssets,
    List<AssetEntity>? pastAssets,
    List<AssetDetailEntity>? allAssets,
    List<dynamic>? currentAssets,
    List<CategoryListEntity>? categories,
    List<BrandListEntity>? brands,
    String? appliedCategory,
    String? appliedBrand,
    int? selectedIndex,
  }) => AssetsLoaded(
    activeAssets: activeAssets ?? this.activeAssets,
    pastAssets: pastAssets ?? this.pastAssets,
    allAssets: allAssets ?? this.allAssets,
    currentAssets: currentAssets ?? this.currentAssets,
    categories: categories ?? this.categories,
    brands: brands ?? this.brands,
    appliedCategory: appliedCategory ?? this.appliedCategory,
    appliedBrand: appliedBrand ?? this.appliedBrand,
    selectedIndex: selectedIndex ?? this.selectedIndex,
  );
}

class AssetsError extends AssetsState {
  final String message;
  const AssetsError({required this.message, required super.selectedIndex});
  @override
  List<Object?> get props => [message, selectedIndex];
}

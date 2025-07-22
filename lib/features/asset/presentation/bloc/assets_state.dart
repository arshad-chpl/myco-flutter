import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/asset/domain/entities/asset_entity.dart';

class AssetsFilterState {
  final String category;
  final String brand;

  AssetsFilterState({required this.category, required this.brand});
}

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
  final List<AssetEntity> activeAssets;
  final List<AssetEntity> pastAssets;
  final List<AssetEntity> allAssets;
  final List<AssetEntity> currentAssets;

  const AssetsLoaded({
    required super.selectedIndex,
    required this.activeAssets,
    required this.pastAssets,
    required this.allAssets,
    required this.currentAssets,
  });

  @override
  List<Object?> get props => [
    activeAssets,
    pastAssets,
    allAssets,
    currentAssets,
    selectedIndex,
  ];

  AssetsLoaded copyWith({
    List<AssetEntity>? activeAssets,
    List<AssetEntity>? pastAssets,
    List<AssetEntity>? allAssets,
    List<AssetEntity>? currentAssets,
    int? selectedIndex,
  }) => AssetsLoaded(
    activeAssets: activeAssets ?? this.activeAssets,
    pastAssets: pastAssets ?? this.pastAssets,
    allAssets: allAssets ?? this.allAssets,
    currentAssets: currentAssets ?? this.currentAssets,
    selectedIndex: selectedIndex ?? this.selectedIndex,
  );
}

class AssetsError extends AssetsState {
  final String message;

  const AssetsError({required this.message, required super.selectedIndex});

  @override
  List<Object?> get props => [message, selectedIndex];
}

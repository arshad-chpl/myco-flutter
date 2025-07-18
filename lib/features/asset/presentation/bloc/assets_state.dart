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

// class AssetsLoaded extends AssetsState {
//   final AssetsEntity assets;

//   const AssetsLoaded({required this.assets, required super.selectedIndex});

//   @override
//   List<Object?> get props => [assets, selectedIndex];
// }

class AssetsLoaded extends AssetsState {
  final List<AssetEntity> assets;
  final List<AssetEntity> originalAssets;
  final int selectedIndex;

  const AssetsLoaded({
    required this.assets,
    required this.originalAssets,
    required this.selectedIndex,
  }) : super(selectedIndex: 0);

  @override
  List<Object?> get props => [assets, originalAssets, selectedIndex];
}

class AssetsError extends AssetsState {
  final String message;

  const AssetsError({required this.message, required super.selectedIndex});

  @override
  List<Object?> get props => [message, selectedIndex];
}

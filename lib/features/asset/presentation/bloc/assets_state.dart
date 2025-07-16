import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/asset/domain/entities/asset_entity.dart';

class AssetsTabState {
  final int selectedIndex;
  AssetsTabState({required this.selectedIndex});
}

class AssetsFilterState {
  final String category;
  final String brand;

  AssetsFilterState({required this.category, required this.brand});
}

abstract class AssetsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AssetsInitial extends AssetsState {}

class AssetsLoading extends AssetsState {}

class AssetsLoaded extends AssetsState {
  final AssetsEntity assets;

  AssetsLoaded(this.assets);

  @override
  List<Object?> get props => [assets];
}

class AssetsError extends AssetsState {
  final String message;

  AssetsError(this.message);

  @override
  List<Object?> get props => [message];
}

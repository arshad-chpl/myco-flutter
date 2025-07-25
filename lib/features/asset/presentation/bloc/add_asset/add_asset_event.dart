import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/asset/domain/entities/add_asset_entity.dart';
import 'package:myco_flutter/features/asset/presentation/utils/asset_enum.dart';

abstract class AddAssetEvent extends Equatable {
  const AddAssetEvent();

  @override
  List<Object?> get props => [];
}

class FetchAddAssetEvent extends AddAssetEvent {
  const FetchAddAssetEvent();

  @override
  List<Object?> get props => [];
}

class SelectAssetCategoryEvent extends AddAssetEvent {
  final CategoryEntity category;

  const SelectAssetCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}

class SetFieldErrorIndexEvent extends AddAssetEvent {
  final AddAssetFieldKey? fieldKey;

  const SetFieldErrorIndexEvent(this.fieldKey);

  @override
  List<Object?> get props => [fieldKey];
}

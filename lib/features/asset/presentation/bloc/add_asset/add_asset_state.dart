import 'package:myco_flutter/features/asset/domain/entities/add_asset_entity.dart';
import 'package:myco_flutter/features/asset/presentation/utils/asset_enum.dart';

class AddAssetState {
  final AddAssetFieldKey? currentFieldErrorKey;

  AddAssetState({this.currentFieldErrorKey});

  AddAssetState copyWith({AddAssetFieldKey? currentFieldErrorKey}) =>
      AddAssetState(currentFieldErrorKey: currentFieldErrorKey);
}

class AddAssetInitial extends AddAssetState {
  AddAssetInitial({super.currentFieldErrorKey});
}

class AddAssetLoading extends AddAssetState {
  AddAssetLoading({super.currentFieldErrorKey});
}

class AddAssetLoaded extends AddAssetState {
  final AddAssetEntity addAssetEntity;

  AddAssetLoaded(this.addAssetEntity, {super.currentFieldErrorKey});

  List<Object?> get props => [addAssetEntity, currentFieldErrorKey];
}

class AddAssetCategorySelected extends AddAssetState {
  final AddAssetEntity addAssetEntity;
  final CategoryEntity selectedCategory;

  AddAssetCategorySelected({
    required this.addAssetEntity,
    required this.selectedCategory,
    super.currentFieldErrorKey,
  });

  List<Object?> get props => [
    addAssetEntity,
    selectedCategory,
    currentFieldErrorKey,
  ];
}

class AddAssetError extends AddAssetState {
  final String message;

  AddAssetError(this.message, {super.currentFieldErrorKey});

  List<Object?> get props => [message, currentFieldErrorKey];
}

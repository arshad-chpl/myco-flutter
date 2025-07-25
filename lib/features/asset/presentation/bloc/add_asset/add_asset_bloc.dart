import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/asset/domain/usecases/asset_usecases.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/add_asset/add_asset_event.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/add_asset/add_asset_state.dart';

class AddAssetBloc extends Bloc<AddAssetEvent, AddAssetState> {
  final AddAssetUseCases addAssetUseCases;

  AddAssetBloc(this.addAssetUseCases) : super(AddAssetInitial()) {
    on<FetchAddAssetEvent>(_onFetchAddAsset);

    on<SelectAssetCategoryEvent>(_onSelectCategory);
    on<SetFieldErrorIndexEvent>(_setFieldErrorIndexEvent);
  }

  Future<void> _onFetchAddAsset(
    FetchAddAssetEvent event,
    Emitter<AddAssetState> emit,
  ) async {
    emit(AddAssetLoading());
    final dataMap = {
      'getAddAssetsData': 'getAddAssetsData',
      'user_id': '1679',
      'society_id': '1',
      'language_id': '1',
      'brand': '0',
    };

    final result = await addAssetUseCases.getAllAssets(dataMap);
    log(name: 'Add Asset Data', result.toString());
    result.fold(
      (failure) => emit(AddAssetError(_mapFailureToMessage(failure))),
      (data) => emit(AddAssetLoaded(data)),
    );
  }

  void _onSelectCategory(
    SelectAssetCategoryEvent event,
    Emitter<AddAssetState> emit,
  ) {
    final currentState = state;
    if (currentState is AddAssetLoaded) {
      emit(
        AddAssetCategorySelected(
          addAssetEntity: currentState.addAssetEntity,
          selectedCategory: event.category,
        ),
      );
    } else if (currentState is AddAssetCategorySelected) {
      emit(
        AddAssetCategorySelected(
          addAssetEntity: currentState.addAssetEntity,
          selectedCategory: event.category,
        ),
      );
    }
  }

  void _setFieldErrorIndexEvent(
    SetFieldErrorIndexEvent event,
    Emitter<AddAssetState> emit,
  ) {
    final currentState = state;

    if (currentState is AddAssetLoaded) {
      emit(
        AddAssetLoaded(
          currentState.addAssetEntity,
          currentFieldErrorKey: event.fieldKey,
        ),
      );
    } else if (currentState is AddAssetCategorySelected) {
      emit(
        AddAssetCategorySelected(
          addAssetEntity: currentState.addAssetEntity,
          selectedCategory: currentState.selectedCategory,
          currentFieldErrorKey: event.fieldKey,
        ),
      );
    } else {
      emit(AddAssetInitial(currentFieldErrorKey: event.fieldKey));
    }
  }

  String _mapFailureToMessage(Failure failure) => failure.message;
}

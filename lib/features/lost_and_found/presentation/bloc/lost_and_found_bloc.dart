import 'package:bloc/bloc.dart';
import 'package:myco_flutter/features/lost_and_found/domain/usecases/lost_and_found_usecases.dart';

import 'lost_and_found_event.dart';
import 'lost_and_found_state.dart';

class LostAndFoundBloc extends Bloc<LostAndFoundEvent, LostAndFoundState> {
  final GetLostAndFoundItemsUseCase getItemsUseCase;

  LostAndFoundBloc(this.getItemsUseCase) : super(LostAndFoundInitial()) {
    on<GetLostAndFoundItemsEvent>((event, emit) async {
      emit(LostAndFoundLoading());
      final result = await getItemsUseCase(event.request);
      result.fold(
        (failure) =>
            emit(LostAndFoundError(failure.message ?? 'Unknown error')),
        (items) => emit(LostAndFoundLoaded(items)),
      );
    });
  }
}

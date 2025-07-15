import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';
import 'package:myco_flutter/features/admin_view/domain/usecases/get_admin_view.dart';
import 'package:myco_flutter/features/admin_view/domain/usecases/get_cached_admin_view.dart';

part 'admin_view_event.dart';
part 'admin_view_state.dart';

class AdminViewBloc extends Bloc<AdminViewEvent, AdminViewState> {
  final GetAdminViewUseCase getAdminViewUseCase;
  final GetCachedAdminViewUseCase getCachedAdminViewUseCase;

  AdminViewBloc({
    required this.getAdminViewUseCase,
    required this.getCachedAdminViewUseCase,
  }) : super(AdminViewInitial()) {
    on<FetchAdminView>(_onFetchAdminView);
  }

  Future<void> _onFetchAdminView(
    FetchAdminView event,
    Emitter<AdminViewState> emit,
  ) async {
    emit(AdminViewLoading());

    // First, try to load and emit data from the cache
    final cachedResult = await getCachedAdminViewUseCase(event.companyId);
    cachedResult.fold((failure) {
      /* Do nothing on cache failure, just proceed to fetch */
    }, (entity) => emit(AdminViewLoaded(adminViewData: entity)));

    // Second, fetch fresh data from the network
    final params = GetAdminViewParams(
      tag: 'getAdminViewNew',
      companyId: event.companyId,
      userId: event.userId,
      languageId: event.languageId,
      isDashboard: true,
      shouldCache: true, // Conditionally cache the fresh data
      accessTypeId: ''
    );
    final freshResult = await getAdminViewUseCase(params);

    // Finally, emit the fresh data or an error if fetching failed
    freshResult.fold((failure) {
      // Only show a network error if we don't have any cached data loaded
      if (state is! AdminViewLoaded) {
        emit(AdminViewError(message: failure.message));
      }
    }, (entity) => emit(AdminViewLoaded(adminViewData: entity)));
  }
}

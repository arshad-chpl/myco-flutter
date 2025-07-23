import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/gallery/domain/entities/get_gallery_new_entity.dart';
import 'package:myco_flutter/features/gallery/domain/usecases/get_gallery_new.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final GetGalleryNewUseCase getGalleryNewUseCase;

  AlbumBloc({required this.getGalleryNewUseCase}) : super(AlbumInitial()) {
    // Registering the event handler for fetching gallery new albums
    on<GetGalleryNew>(_getGalleryNewAlbum);
  }

  // Bloc event fires
  // Use case receives parameters and calls repository
  // GalleryRepositoryImpl.getGalleryNew checks network, calls remote data source
  // GetGalleryNewRemoteDataSourceImpl.getGalleryNew makes the API call
  // Result sent back up to UI/Bloc
  Future<void> _getGalleryNewAlbum(
    GetGalleryNew event,
    Emitter<AlbumState> emit,
  ) async {
    // loading state
    emit(AlbumLoading());

    final param = GetGalleryNewParams(
      tag: 'getGalleryNew',
      societyId: event.societyId,
      userId: event.userId,
      languageId: event.languageId,
      floorId: event.floorId,
      blockId: event.blockId,
      galleryAlbumId: event.galleryAlbumId,
    );

    // Fetching the gallery new album
    final freshResult = await getGalleryNewUseCase(param);

    // dev.log(
    //   'AlbumBloc._getGalleryNewAlbum: '
    //   'Fetched gallery new album with params: $freshResult',
    //   name: 'AlbumBloc',
    // );

    // Emitting the result
    freshResult.fold(
      (failure) {
        if (state is! AlbumLoaded) {
          emit(AlbumError(message: failure.message));
        }
      },
      (entity) {
        emit(AlbumLoaded(getGalleryNewEntity: entity));
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/gallery/domain/entities/gallery_album_entity.dart';
import 'package:myco_flutter/features/gallery/domain/usecases/get_gallery_album.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GetGalleryAlbumUseCase getGalleryAlbumUseCase;

  GalleryBloc({required this.getGalleryAlbumUseCase})
    : super(GalleryInitial()) {
    // Registering the event handler for fetching gallery albums
    on<GetGalleryAlbum>(_fetchGalleryAlbum);
  }

  // Bloc event fires
  // Use case receives parameters and calls repository
  // GalleryRepositoryImpl.getGalleryAlbum checks network, calls remote data source
  // GalleryAlbumRemoteDataSourceImpl.getGalleryAlbum makes the API call
  // Result sent back up to UI/Bloc
  Future<void> _fetchGalleryAlbum(
    GetGalleryAlbum event,
    Emitter<GalleryState> emit,
  ) async {
    // loading state
    emit(GalleryLoading());

    final param = GetGalleryAlbumParams(
      tag: 'getGalleryAlbum',
      societyId: event.societyId, // p
      userId: event.userId, // p
      languageId: event.languageId, // p
      floorId: event.floorId,
      blockId: event.blockId,
      filterYear: event.filterYear,
    );

    // Fetching the gallery album
    final freshResult = await getGalleryAlbumUseCase(param);

    // dev.log(
    //   'GalleryBloc._fetchGalleryAlbum: '
    //   'Fetched gallery album with params: $freshResult',
    //   name: 'GalleryBloc',
    // );

    // Emitting the result
    freshResult.fold(
      (failure) {
        if (state is! GalleryLoaded) {
          emit(GalleryError(message: failure.message));
        }
      },
      (entity) {
        emit(GalleryLoaded(galleryAlbumEntity: entity));
      },
    );
  }
}

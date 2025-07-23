part of 'gallery_bloc.dart';

sealed class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object> get props => [];
}

final class GalleryInitial extends GalleryState {}

final class GalleryLoading extends GalleryState {}

final class GalleryAlbumLoaded extends GalleryState {
  final GalleryAlbumEntity galleryAlbumEntity;

  const GalleryAlbumLoaded({required this.galleryAlbumEntity});

  @override
  List<Object> get props => [galleryAlbumEntity];
}

final class GalleryNewLoaded extends GalleryState {
  final GetGalleryNewEntity getGalleryNewEntity;

  const GalleryNewLoaded({required this.getGalleryNewEntity});

  @override
  List<Object> get props => [getGalleryNewEntity];
}

final class GalleryError extends GalleryState {
  final String message;

  const GalleryError({required this.message});

  @override
  List<Object> get props => [message];
}

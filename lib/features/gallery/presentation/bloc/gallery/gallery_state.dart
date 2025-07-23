part of 'gallery_bloc.dart';

sealed class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object> get props => [];
}

final class GalleryInitial extends GalleryState {}

final class GalleryLoading extends GalleryState {}

// State when the gallery album is successfully loaded
final class GalleryLoaded extends GalleryState {
  final GalleryAlbumEntity galleryAlbumEntity;

  const GalleryLoaded({required this.galleryAlbumEntity});

  @override
  List<Object> get props => [galleryAlbumEntity];
}

final class GalleryError extends GalleryState {
  final String message;

  const GalleryError({required this.message});

  @override
  List<Object> get props => [message];
}

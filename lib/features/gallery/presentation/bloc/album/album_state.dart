part of 'album_bloc.dart';

sealed class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

final class AlbumInitial extends AlbumState {}

final class AlbumLoading extends AlbumState {}

// State when the new gallery album is successfully loaded
final class AlbumLoaded extends AlbumState {
  final GetGalleryNewEntity getGalleryNewEntity;

  const AlbumLoaded({required this.getGalleryNewEntity});

  @override
  List<Object> get props => [getGalleryNewEntity];
}

final class AlbumError extends AlbumState {
  final String message;

  const AlbumError({required this.message});

  @override
  List<Object> get props => [message];
}

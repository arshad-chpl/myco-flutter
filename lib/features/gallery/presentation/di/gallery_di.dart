import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:myco_flutter/features/gallery/data/datasources/gallery_album_remote_data_source.dart';
import 'package:myco_flutter/features/gallery/data/datasources/gallery_album_remote_data_source_impl.dart';
import 'package:myco_flutter/features/gallery/data/datasources/get_gallery_new_remote_data_source.dart';
import 'package:myco_flutter/features/gallery/data/datasources/get_gallery_new_remote_data_source_impl.dart';
import 'package:myco_flutter/features/gallery/data/repositories/gallery_repository_impl.dart';
import 'package:myco_flutter/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:myco_flutter/features/gallery/domain/usecases/get_gallery_album.dart';
import 'package:myco_flutter/features/gallery/domain/usecases/get_gallery_new.dart';
import 'package:myco_flutter/features/gallery/presentation/bloc/gallery_bloc.dart';

Future<void> galleryDi(GetIt sl) async {
  // data sources
  sl.registerLazySingleton<GalleryAlbumRemoteDataSource>(
    () => GalleryAlbumRemoteDataSourceImpl(
      apiClient: sl<ApiClient>(instanceName: VariableBag.residentApiNew),
    ),
  );
  sl.registerLazySingleton<GetGalleryNewRemoteDataSource>(
    () => GetGalleryNewRemoteDataSourceImpl(
      apiClient: sl<ApiClient>(instanceName: VariableBag.residentApiNew),
    ),
  );

  // repository
  sl.registerLazySingleton<GalleryRepository>(
    () => GalleryRepositoryImpl(
      remoteDataSource: sl<GalleryAlbumRemoteDataSource>(),
      getGalleryNewRemoteDataSource: sl<GetGalleryNewRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // use cases
  sl.registerLazySingleton(
    () => GetGalleryAlbumUseCase(repository: sl<GalleryRepository>()),
  );
  sl.registerLazySingleton(
    () => GetGalleryNewUseCase(repository: sl<GalleryRepository>()),
  );

  // bloc
  sl.registerFactory(
    () => GalleryBloc(
      getGalleryAlbumUseCase: sl<GetGalleryAlbumUseCase>(),
      getGalleryNewUseCase: sl<GetGalleryNewUseCase>(),
    ),
  );
}

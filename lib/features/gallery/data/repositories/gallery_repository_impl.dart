// class AdminViewRepositoryImpl extends AdminViewRepository {
//   final AdminViewRemoteDataSource remoteDataSource;
//   final AdminViewLocalDataSource localDataSource;
//   final NetworkInfo networkInfo;

//   AdminViewRepositoryImpl({
//     required this.remoteDataSource,
//     required this.localDataSource,
//     required this.networkInfo,
//   });

//   @override
//   Future<Either<Failure, AdminViewResponseEntity>> getAdminView(
//     AdminViewRequest request,
//   ) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remoteModel = await remoteDataSource.getAdminViewNew(request);
//         if (request.shouldCache && request.companyId != null) {
//           await localDataSource.cacheAdminView(request.companyId!, remoteModel);
//         }
//         return Right(remoteModel.toEntity());
//       } on Exception catch (e) {
//         return Left(ServerFailure(e.toString()));
//       }
//     } else {
//       return getCachedAdminView(request.companyId ?? '');
//     }
//   }

//   @override
//   Future<Either<Failure, AdminViewResponseEntity>> getCachedAdminView(
//     String companyId,
//   ) async {
//     try {
//       final localModel = await localDataSource.getLastAdminView(companyId);
//       return Right(localModel.toEntity());
//     } on Exception {
//       return const Left(CacheFailure('No cached data found.'));
//     }
//   }
// }

import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:myco_flutter/features/gallery/data/datasources/gallery_album_remote_data_source.dart';
import 'package:myco_flutter/features/gallery/data/datasources/get_gallery_new_remote_data_source.dart';
import 'package:myco_flutter/features/gallery/data/models/gallery_request.dart';
import 'package:myco_flutter/features/gallery/domain/entities/gallery_album_entity.dart';
import 'package:myco_flutter/features/gallery/domain/entities/get_gallery_new_entity.dart';
import 'package:myco_flutter/features/gallery/domain/repositories/gallery_repository.dart';

class GalleryRepositoryImpl extends GalleryRepository {
  final GalleryAlbumRemoteDataSource remoteDataSource;
  final GetGalleryNewRemoteDataSource getGalleryNewRemoteDataSource;
  final NetworkInfo networkInfo;

  GalleryRepositoryImpl({
    required this.remoteDataSource,
    required this.getGalleryNewRemoteDataSource,
    required this.networkInfo,
  });

  // This method retrieves the gallery album data from the remote server.
  // It sends a request with the provided parameters and returns the response entity.
  // If the network is not available, it returns a NetworkFailure.
  // If the request fails, it returns a ServerFailure with the error message.
  // If the request is successful, it converts the response model to an entity and returns it
  @override
  Future<Either<Failure, GalleryAlbumEntity>> getGalleryAlbum(
    GalleryRequest request,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteModel = await remoteDataSource.getGalleryAlbum(request);

        dev.log('🔍 remoteModel.status = ${remoteModel.status}');
        dev.log('📝 remoteModel.message = ${remoteModel.message}');

        // Convert the remote model to an entity and return it
        // The entity contains the list of event albums, message, and status.
        // If the remote model is null or has no albums, it will return an empty entity
        return Right(remoteModel.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  // This method retrieves the new gallery data from the remote server.
  // It sends a request with the provided parameters and returns the response entity.
  // If the network is not available, it returns a NetworkFailure.
  // If the request fails, it returns a ServerFailure with the error message.
  // If the request is successful, it converts the response model to an entity and returns it
  @override
  Future<Either<Failure, GetGalleryNewEntity>> getGalleryNew(
    GalleryRequest request,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteModel = await getGalleryNewRemoteDataSource.getGalleryNew(
          request,
        );
        dev.log('🔍 remoteModel.status = ${remoteModel.status}');
        dev.log('📝 remoteModel.message = ${remoteModel.message}');

        // Convert the remote model to an entity and return it
        // The entity contains the list of images, message, and status.
        // If the remote model is null or has no images, it will return an empty entity
        return Right(remoteModel.toEntity());
      } on Exception catch (e) {
        dev.log('Error fetching new gallery: $e');
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }
}

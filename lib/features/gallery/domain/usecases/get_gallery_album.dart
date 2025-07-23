// class GetAdminViewUseCase {
//   final AdminViewRepository repository;

//   GetAdminViewUseCase({required this.repository});

//   Future<Either<Failure, AdminViewResponseEntity>> call(
//     GetAdminViewParams params,
//   ) async {
//     final request = AdminViewRequest(
//       tag: params.tag,
//       companyId: params.companyId,
//       userId: params.userId,
//       languageId: params.languageId,
//       isDashboard: params.isDashboard,
//       accessTypeId: params.accessTypeId,
//       shouldCache: params.shouldCache,
//     );
//     return await repository.getAdminView(request);
//   }
// }

// class GetAdminViewParams extends Equatable {
//   final String tag;
//   final String companyId;
//   final String userId;
//   final String languageId;
//   final bool isDashboard;
//   final String? accessTypeId;
//   final bool shouldCache;

//   const GetAdminViewParams({
//     required this.tag,
//     required this.companyId,
//     required this.userId,
//     required this.languageId,
//     required this.isDashboard,
//     required this.shouldCache,
//     this.accessTypeId,
//   });

//   @override
//   List<Object?> get props => [
//     tag,
//     companyId,
//     userId,
//     languageId,
//     isDashboard,
//     accessTypeId,
//     shouldCache,
//   ];
// }

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/gallery/data/models/gallery_request.dart';
import 'package:myco_flutter/features/gallery/domain/entities/gallery_album_entity.dart';
import 'package:myco_flutter/features/gallery/domain/repositories/gallery_repository.dart';

class GetGalleryAlbumUseCase {
  final GalleryRepository repository;

  GetGalleryAlbumUseCase({required this.repository});

  // This method receives parameters and calls the repository
  Future<Either<Failure, GalleryAlbumEntity>> call(
    GetGalleryAlbumParams params,
  ) async {
    final request = GalleryRequest(
      tag: params.tag,
      societyId: params.societyId,
      userId: params.userId,
      languageId: params.languageId,
      floorId: params.floorId,
      blockId: params.blockId,
      filterYear: params.filterYear,
    );

    return await repository.getGalleryAlbum(request);
  }
}

class GetGalleryAlbumParams extends Equatable {
  final String tag;
  final String societyId;
  final String userId;
  final String languageId;
  final String floorId;
  final String blockId;
  final String filterYear;

  const GetGalleryAlbumParams({
    required this.tag,
    required this.societyId,
    required this.userId,
    required this.languageId,
    required this.floorId,
    required this.blockId,
    required this.filterYear,
  });

  @override
  List<Object?> get props => [
    tag,
    societyId,
    userId,
    languageId,
    floorId,
    blockId,
    filterYear,
  ];
}

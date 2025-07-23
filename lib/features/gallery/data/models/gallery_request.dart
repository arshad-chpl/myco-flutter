// getGalleryAlbum:getGalleryAlbum
// language_id:1
// user_id:1
// society_id:1
// floor_id:151
// block_id:30
// filter_year:2024
// getGalleryNew:getGalleryNew
// gallery_album_id:1

// This file defines the GalleryRequest model used for making requests to getGalleryAlbum and getGalleryAlbum
class GalleryRequest {
  final String? tag;
  final String? societyId;
  final String? userId;
  final String? languageId;
  final String? floorId;
  final String? blockId;
  final String? filterYear;

  final String? galleryAlbumId;

  GalleryRequest({
    this.tag,
    this.societyId,
    this.userId,
    this.languageId,
    this.floorId,
    this.blockId,
    this.filterYear,
    this.galleryAlbumId,
  });

  Map<String, dynamic> toJson() => {
    '$tag': tag,
    'society_id': societyId,
    'user_id': userId,
    'language_id': languageId,
    'floor_id': floorId,
    'block_id': blockId,
    if (filterYear != null)
      'filter_year':
          filterYear, // no use for getGalleryNew, but use for getGalleryAlbum
    if (galleryAlbumId != null)
      'gallery_album_id':
          galleryAlbumId, // no use for getGalleryAlbum, but use for getGalleryNew
  };
}

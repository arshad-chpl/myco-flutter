// abstract class AdminViewRemoteDataSource {
//   Future<AdminViewResponseModel> getAdminViewNew(AdminViewRequest request);
// }

import 'package:myco_flutter/features/gallery/data/models/gallery_album_response_model.dart';
import 'package:myco_flutter/features/gallery/data/models/gallery_request.dart';

abstract class GalleryAlbumRemoteDataSource {
  // This abstract class defines the contract for the remote data source
  // that retrieves gallery album data from a remote server.
  // It contains a method to get the gallery album data based on the provided request.
  // The method returns a Future of GalleryAlbumResponseModel, which contains the list of event albums,
  // message, and status.
  // The implementation of this method will be provided in the concrete class.
  // The request parameter is of type GalleryAlbumRequest, which contains the necessary parameters
  // to fetch the gallery album data.
  // The method is expected to handle any exceptions and return the appropriate response.
  Future<GalleryAlbumResponseModel> getGalleryAlbum(GalleryRequest request);
}

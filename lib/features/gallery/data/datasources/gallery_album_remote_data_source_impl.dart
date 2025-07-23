// class AdminViewRemoteDataSourceImpl extends AdminViewRemoteDataSource {
//   @override
//   Future<AdminViewResponseModel> getAdminViewNew(
//     AdminViewRequest request,
//   ) async {
//     final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
//     final response = await GetIt.I<ApiClient>(
//       instanceName: VariableBag.employeeMobileApi,
//     ).postDynamic('admin_view_controller.php', encryptedBody);
//     return AdminViewResponseModel.fromJson(
//       json.decode(GzipUtil.decryptAES(response)),
//     );
//   }
// }

import 'dart:convert';
import 'dart:developer' as dev;

import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/gallery/data/datasources/gallery_album_remote_data_source.dart';
import 'package:myco_flutter/features/gallery/data/models/gallery_album_response_model.dart';
import 'package:myco_flutter/features/gallery/data/models/gallery_request.dart';

class GalleryAlbumRemoteDataSourceImpl extends GalleryAlbumRemoteDataSource {
  ApiClient apiClient;

  GalleryAlbumRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<GalleryAlbumResponseModel> getGalleryAlbum(
    GalleryRequest request,
  ) async {
    // This method retrieves the gallery album data from the remote server.
    // It sends a request with the provided parameters and returns the response model.
    try {
      // final requestBody = jsonEncode(request);

      dev.log(
        'Request Body: ${request.toJson()}',
        name: 'GalleryAlbumRemoteDataSourceImpl.getGalleryAlbum',
      );
      // dev.log('URl: ${VariableBag.employeeMobileApi}');

      // Using the ApiClient to post the request to the server
      // and decode the response into a GalleryAlbumResponseModel.
      // The instanceName is set to VariableBag.employeeMobileApi to specify the API endpoint.
      final response = await apiClient.postFormDynamic(
        'get_event_gallery_controller.php',
        request.toJson(),
      );

      dev.log(
        'GalleryAlbumRemoteDataSourceImpl.getGalleryAlbum: ${response.toString()}',
        name: 'GalleryAlbumRemoteDataSourceImpl',
      );

      // Decoding the JSON response and returning the GalleryAlbumResponseModel.
      return GalleryAlbumResponseModel.fromJson(json.decode(response));
    } on Exception catch (e) {
      throw Exception('Failed to fetch gallery albums: $e');
    }
  }
}

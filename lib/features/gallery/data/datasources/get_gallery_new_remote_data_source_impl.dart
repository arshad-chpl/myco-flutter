import 'dart:convert';
import 'dart:developer' as dev;

import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/gallery/data/datasources/get_gallery_new_remote_data_source.dart';
import 'package:myco_flutter/features/gallery/data/models/gallery_request.dart';
import 'package:myco_flutter/features/gallery/data/models/get_gallery_new_response_model.dart';

class GetGalleryNewRemoteDataSourceImpl extends GetGalleryNewRemoteDataSource {
  ApiClient apiClient;

  GetGalleryNewRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<GetGalleryNewResponseModel> getGalleryNew(
    GalleryRequest request,
  ) async {
    try {
      // This method retrieves the new gallery data from the remote server.
      // It sends a request with the provided parameters and returns the response model.
      dev.log(
        'Request Body: ${request.toJson()}',
        name: 'GetGalleryNewRemoteDataSourceImpl.getGalleryNew',
      );

      // This method retrieves the whole gallery data from the remote server.
      // It sends a request with the provided parameters and returns the response
      final response = await apiClient.postFormDynamic(
        'get_event_gallery_controller.php',
        request.toJson(),
      );

      dev.log(
        'GetGalleryNewRemoteDataSourceImpl.getGalleryNew: ${response.toString()}',
        name: 'GetGalleryNewRemoteDataSourceImpl',
      );

      // Decoding the JSON response and returning the GetGalleryNewResponseModel.
      return GetGalleryNewResponseModel.fromJson(json.decode(response));
    } on Exception catch (e) {
      throw Exception('Failed to fetch get gallery new: $e');
    }
  }
}

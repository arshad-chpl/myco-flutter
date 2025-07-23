import 'package:myco_flutter/features/gallery/data/models/gallery_request.dart';
import 'package:myco_flutter/features/gallery/data/models/get_gallery_new_response_model.dart';

abstract class GetGalleryNewRemoteDataSource {
  // This abstract class defines the contract for the remote data source
  // that retrieves new gallery data from a remote server.
  // It contains a method to get the new gallery data based on the provided request.
  // The method returns a Future of GetGalleryNewResponseModel, which contains the list of images,
  // message, and status.
  // The implementation of this method will be provided in the concrete class.
  // The request parameter is of type GalleryRequest, which contains the necessary parameters
  // to fetch the new gallery data.
  // The method is expected to handle any exceptions and return the appropriate response.
  // The response is expected to be in the format defined by the GetGalleryNewResponseModel.
  // If the response is not in the expected format, it will throw an error.
  // If the request fails, it will throw an exception with the error message. 
  Future<GetGalleryNewResponseModel> getGalleryNew(GalleryRequest request);
}

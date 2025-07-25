import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: VariableBag.mainURL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // JSON POST
  @POST('{path}')
  Future<String> postDynamic(@Path('path') String path, @Body() String body);

  // GET
  @GET('{path}')
  Future<String> getDynamic(
    @Path('path') String path,
    @Queries() Map<String, dynamic> queryParams,
  );

  // PUT
  @PUT('{path}')
  Future<String> putDynamic(@Path("path") String path, @Body() String body);

  // DELETE
  @DELETE('{path}')
  Future<String> deleteDynamic(
    @Path('path') String path,
    @Queries() Map<String, dynamic> queryParams,
  );

  // FORM URL ENCODED
  @POST('{path}')
  @FormUrlEncoded()
  Future<String> postFormDynamic(
    @Path('path') String path,
    @Body() Map<String, dynamic> fields,
  );

  // MULTIPART (Example: One file + multiple fields)
  @POST('{path}')
  @MultiPart()
  Future<String> postMultipartDynamic(
    @Path('path') String path,
    @Part(name: 'user_id') String userId,
    @Part(name: 'description') String description,
    @Part(name: 'file') File file, // File will be converted to MultipartFile
  );

  @POST('{path}')
  @MultiPart()
  Future<String> postMultipartImage(
      @Path('path') String path,
      @Part(name: 'uploadImageToTemp') String tag,
      @Part(name: 'society_id') String? societyId,
      @Part(name: 'user_id') String? userId,
      @Part(name: 'beforeLogIn') String beforeLogIn,
      @Part(name: 'file_format_name') String? fileFormatName,
      @Part(name: 'img[]') List<MultipartFile> images);
}


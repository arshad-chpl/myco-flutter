import 'package:equatable/equatable.dart';

class UploadFileResponseEntity extends Equatable {
  final String? baseUrl;
  final List<String>? imgNameArr;
  final String? message;
  final String? status;

  const UploadFileResponseEntity({
    this.baseUrl,
    this.imgNameArr,
    this.message,
    this.status,
  });

  @override
  List<Object?> get props => [baseUrl, imgNameArr, message, status];
}

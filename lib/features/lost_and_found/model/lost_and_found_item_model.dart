import 'dart:io';

class LostAndFoundItemModel {
  final File image;
  final String name;
  final String description;
  final String status;
  final DateTime dateTime;

  LostAndFoundItemModel({
    required this.image,
    required this.name,
    required this.description,
    required this.status,
    required this.dateTime,
  });
}

import 'package:flutter/material.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';

class AlbumViewScreen extends StatefulWidget {
  final String albumName;

  const AlbumViewScreen({super.key, required this.albumName});

  @override
  State<AlbumViewScreen> createState() => _AlbumViewScreenState();
}

class _AlbumViewScreenState extends State<AlbumViewScreen> {
  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: CustomAppbar(title: 'Album View'),
    body: Column(
      children: [
        Text('Album View Screen'),
        // Add your album view content here
      ],
    ),
  );
}

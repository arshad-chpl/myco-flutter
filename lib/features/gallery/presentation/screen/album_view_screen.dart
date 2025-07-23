import 'package:flutter/material.dart';

class AlbumViewScreen extends StatefulWidget {
  final String albumName;
  const AlbumViewScreen({required this.albumName, super.key});

  @override
  State<AlbumViewScreen> createState() => _AlbumViewScreenState();
}

class _AlbumViewScreenState extends State<AlbumViewScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Album View')),
    body: Center(
      child: Text(
        'Album View Screen',
        style: TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _openCamera() {}

  void _openGallery(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter ML Kit')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text('No Photo found')),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _openCamera(),
            child: const Icon(Icons.camera),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => _openGallery(context),
            child: const Icon(Icons.photo),
          ),
        ],
      ),
    );
  }
}

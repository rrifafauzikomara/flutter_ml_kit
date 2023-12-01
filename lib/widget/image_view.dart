import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.file}) : super(key: key);

  final File file;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Image.file(file),
    );
  }
}

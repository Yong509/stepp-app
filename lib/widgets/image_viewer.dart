import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "",
      child: EasyImageView(
        imageProvider: const AssetImage("assets/images/thumbnail.jpg"),
      ),
    );
  }
}
